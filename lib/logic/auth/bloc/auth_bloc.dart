import 'package:bloc/bloc.dart';
import 'package:ecommerce_v3/data/repository/auth_repo.dart';
import 'package:ecommerce_v3/data/repository/registration_repo.dart';
import 'package:ecommerce_v3/logic/auth/form/confirm_password.dart';
import 'package:ecommerce_v3/logic/auth/form/email.dart';
import 'package:ecommerce_v3/logic/auth/form/firstname.dart';
import 'package:ecommerce_v3/logic/auth/form/lastname.dart';
import 'package:ecommerce_v3/logic/auth/form/password.dart';
import 'package:ecommerce_v3/logic/auth/form/username.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/user_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final emitter = null;
  AuthBloc()
      : super(
          AuthState(
              firstname: FirstnameField.pure(),
              lastname: LastnameField.pure(),
              email: EmailInput.pure(),
              username: UsernameField.pure(),
              password: PasswordField.pure(),
              confirmPassword: ConfirmPasswordField.pure(),
              isAuthScreenChange: true,
              isAlreadyLoggedIn: false,
              user: User(
                  id: "0",
                  firstname: "firstname",
                  lastname: "lastname",
                  username: "username",
                  email: "email",
                  createAt: "createAt",
                  updateAt: "updateAt",
                  token: ""),
              isConnectionOn: false),
        ) {
    on<AuthEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(_mapEmailChangedToState(event));
      } else if (event is FirstnameChanged) {
        emit(_mapFirstnameChangedToState(event));
      } else if (event is LastnameChanged) {
        emit(_mapLastnameChangedToState(event));
      } else if (event is UsernameChanged) {
        emit(_mapUsernameChangedToState(event));
      } else if (event is PasswordChanged) {
        emit(_mapPasswordChangedToState(event));
      } else if (event is ConfirmPasswordChanged) {
        emit(_mapConfirmPasswordChangedToState(event));
      } else if (event is AuthScreenChanged) {
        emit(_mapAuthScreenChangeToState(event));
      } else if (event is FormCleaned) {
        emit(_mapAuthFormCleanedToState(event));
      } else if (event is SignInSubmitted) {
        (_mapSignInSubmittedToState(event, emit));
      } else if (event is SignUpSubmitted) {
        (_mapSignUpSubmittedToState(event, emit));
      } else if (event is IsAlreadyLoggedIn) {
        emit(_mapIsUserAlreadyLoggedInState(event));
      } else if (event is UserLoaded) {
        emit(_mapUserLoadedState(event));
      }
    });
  }
  RegistrationRepository registrationRepository = RegistrationRepository();
  AuthState _mapFirstnameChangedToState(FirstnameChanged event) {
    final firstname = FirstnameField.dirty(event.firstname);
    return state.copyWith(
        firstname: firstname, status: Formz.validate([firstname]));
  }

  AuthState _mapLastnameChangedToState(LastnameChanged event) {
    final lastname = LastnameField.dirty(event.lastname);
    return state.copyWith(
        lastname: lastname, status: Formz.validate([lastname]));
  }

  AuthState _mapEmailChangedToState(EmailChanged event) {
    final email = EmailInput.dirty(event.email);
    return state.copyWith(email: email, status: Formz.validate([email]));
  }

  AuthState _mapPasswordChangedToState(PasswordChanged event) {
    final password = PasswordField.dirty(event.password);

    return state.copyWith(
        password: password, status: Formz.validate([password]));
  }

  AuthState _mapConfirmPasswordChangedToState(ConfirmPasswordChanged event) {
    final confirmPassword = ConfirmPasswordField.dirty(event.confirmPassword);

    return state.copyWith(
        confirmPassword: confirmPassword,
        status: Formz.validate([confirmPassword]));
  }

  AuthState _mapUsernameChangedToState(UsernameChanged event) {
    final username = UsernameField.dirty(event.username);

    return state.copyWith(
        username: username, status: Formz.validate([username]));
  }

  AuthState _mapAuthScreenChangeToState(AuthScreenChanged event) {
    final isAuthScreenChange = !state.isAuthScreenChange;
    return state.copyWith(
      isAuthScreenChange: isAuthScreenChange,
    );
  }

  AuthState _mapAuthFormCleanedToState(FormCleaned event) {
    final EmailInput email = EmailInput.dirty('');
    final UsernameField username = UsernameField.dirty('');
    final PasswordField password = PasswordField.dirty('');

    return state.copyWith(email: email, username: username, password: password);
  }

  AuthState _mapIsUserAlreadyLoggedInState(IsAlreadyLoggedIn event) {
    return state.copyWith(isAlreadyLoggedIn: event.isUserLoggedIn);
  }

  AuthState _mapUserLoadedState(UserLoaded event) {
    // print("state first name: " + event.user.firstname);
    return state.copyWith(user: event.user);
  }

  void _mapSignInSubmittedToState(event, emit) async {
    final email = EmailInput.dirty(state.email.value);
    final password = PasswordField.dirty(state.password.value);
    final status = Formz.validate([email, password]);

    emit(state.copyWith(email: email, password: password, status: status));

    if (status.isValidated) {
      print("login validated");
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      // API CALL
      try {
        AuthRepository()
            .authenticate(
                password: state.password.value, email: state.email.value)
            .then((value) async {
          if (value is User) {
            final Future<SharedPreferences> _prefs =
                SharedPreferences.getInstance();
            final SharedPreferences prefs = await _prefs;
            prefs.setString("id", value.id);
            prefs.setString("firstName", value.firstname);
            prefs.setString("lastName", value.lastname);
            prefs.setString("email", value.email);
            prefs.setString("username", value.username);
            prefs.setString("createdAt", value.createAt);
            prefs.setString("updatedAt", value.updateAt);
            prefs.setString("token", value.token);
            print('bloc state...');

            _submissionSuccess();
          } else {
            value as http.Response;
            if (value.statusCode == 409) {
              _submissionUserExist();
            } else if (value.statusCode == 401) {
              _submissionServerError();
            } else if (value.statusCode == 422) {
              print(value.body);
              _submissionServerError();
            } else if (value.statusCode == 502) {
              _connectionError();
            }
          }
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  void _mapSignUpSubmittedToState(event, emit) {
    final firstname = FirstnameField.dirty(state.firstname.value);
    final lastname = LastnameField.dirty(state.lastname.value);
    final email = EmailInput.dirty(state.email.value);
    final username = UsernameField.dirty(state.username.value);
    final password = PasswordField.dirty(state.password.value);
    final confirmPassword =
        ConfirmPasswordField.dirty(state.confirmPassword.value);
    final status = Formz.validate(
        [firstname, lastname, email, password, username, confirmPassword]);
    emit(state.copyWith(
        firstname: firstname,
        lastname: lastname,
        email: email,
        username: username,
        password: password,
        confirmPassword: confirmPassword,
        status: status));

    if (status.isValidated) {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      try {
        registrationRepository
            .postUserData(
                firstname: state.firstname.value,
                lastname: state.lastname.value,
                username: state.username.value,
                email: state.email.value,
                password: state.password.value,
                confirmPassword: state.confirmPassword.value)
            .then((value) {
          if (value == "200") {
            _submissionSuccess();
          } else if (value == "409") {
            _submissionUserExist();
          } else if (value == "422") {
            _submissionServerError();
          } else if (value == "401") {
            _submissionServerError();
          } else if (value == "502") {
            _connectionError();
          }
        });
      } catch (e) {}
    }
  }

  _submissionSuccess() {
    emit(state.copyWith(
      status: FormzStatus.submissionSuccess,
    ));
  }

  _submissionServerError() {
    emit(state.copyWith(
      status: FormzStatus.submissionFailure,
    ));
  }

  _submissionUserExist() {
    emit(state.copyWith(
      status: FormzStatus.submissionCanceled,
    ));
  }

  _connectionError() {
    emit(state.copyWith(
      isConnectionOn: true,
    ));
  }
}
