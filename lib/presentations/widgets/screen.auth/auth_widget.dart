import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/logic/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_v3/presentations/common/theme_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key, required this.globalContext}) : super(key: key);
  final GlobalKey<ScaffoldState> globalContext;
  @override
  State<AuthWidget> createState() => _AuthWidgetState(globalContext);
}

class _AuthWidgetState extends State<AuthWidget> {
  _AuthWidgetState(this.globalContext);
  final GlobalKey<ScaffoldState> globalContext;
  final _formKey = GlobalKey<FormState>();
  Widget signUpButton = const Text('Sign up');
  Widget dialogPage = Container();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isAuthScreenChange == true) {
          return _signInForm(context);
        } else {
          return _signUpForm(context);
        }
      },
    );
  }

  Widget _signUpForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _emailField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _firstNameField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _lastNameField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _userNameField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _passwordField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _confirmPasswordField(),
                    const SizedBox(
                      height: 15,
                    ),
                    _signUpButton(),
                    _textLink(context, 'Already have an account?', ' sign in'),
                    dialogPage
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _signInForm(context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailField(),
              const SizedBox(
                height: 15,
              ),
              _passwordField(),
              const SizedBox(
                height: 15,
              ),
              _signInButton(),
              _textLink(context, 'Didn\'t have an account?', ' Create'),
              dialogPage
            ],
          ),
        ));
  }

  Widget _emailField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: false,
          decoration: ThemeHelper().textInputDecoration(
              'Email',
              'Email is required',
              state.email.error.toString(),
              state.email.invalid,
              const Icon(Icons.email)),
          onChanged: (value) {
            BlocProvider.of<AuthBloc>(context).add(EmailChanged(email: value));
          },
        );
      },
    );
  }

  Widget _firstNameField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: false,
          decoration: ThemeHelper().textInputDecoration(
              'First name',
              'First name is required',
              state.firstname.error.toString(),
              state.firstname.invalid,
              const Icon(Icons.text_format)),
          onChanged: (value) => BlocProvider.of<AuthBloc>(context)
              .add(FirstnameChanged(firstname: value)),
        );
      },
    );
  }

  Widget _lastNameField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: false,
          decoration: ThemeHelper().textInputDecoration(
              'Last name',
              'Last name is required',
              state.lastname.error.toString(),
              state.lastname.invalid,
              const Icon(Icons.text_format)),
          onChanged: (value) => BlocProvider.of<AuthBloc>(context)
              .add(LastnameChanged(lastname: value)),
        );
      },
    );
  }

  Widget _userNameField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: false,
          decoration: ThemeHelper().textInputDecoration(
              'Username',
              'Username is required',
              state.username.error.toString(),
              state.username.invalid,
              const Icon(Icons.person)),
          onChanged: (value) => BlocProvider.of<AuthBloc>(context)
              .add(UsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: ThemeHelper().textInputDecoration(
              'Password',
              'Password is required',
              state.password.error.toString(),
              state.password.invalid,
              const Icon(Icons.password),
              const Icon(Icons.remove_red_eye)),
          onChanged: (value) {
            BlocProvider.of<AuthBloc>(context)
                .add(PasswordChanged(password: value));
          },
        );
      },
    );
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: ThemeHelper().textInputDecoration(
              'Confirm password',
              'Confirmation is required',
              state.confirmPassword.error.toString(),
              state.confirmPassword.invalid,
              const Icon(Icons.password),
              const Icon(Icons.remove_red_eye)),
          validator: (value) {
            if ((value) != (state.password.value)) {
              return 'password does not match!';
            }
          },
          onChanged: (value) {
            BlocProvider.of<AuthBloc>(context)
                .add(ConfirmPasswordChanged(confirmPassword: value));
          },
        );
      },
    );
  }

  Widget _signUpButton() {
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      return ElevatedButton(
          onPressed: () {
            if (!(state.status == FormzStatus.submissionSuccess)) {
              BlocProvider.of<AuthBloc>(context).add(SignUpSubmitted());
            }
          },
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(child: signUpButton)));
    }, listenWhen: (current, previous) {
      return current.isAuthScreenChange == previous.isAuthScreenChange;
    }, listener: (context, state) {
      if (state.status == FormzStatus.submissionSuccess) {
        Navigator.of(context).pushNamed('/main');
      }
      if (state.status == FormzStatus.submissionCanceled) {
        setState(() {
          dialogPage = _showMyDialog(
              title: 'User Already Exist',
              description: 'this email or username already exist.',
              description2: "try again with different email or username.");
        });
      }

      if (state.status == FormzStatus.submissionInProgress) {
        setState(() {
          signUpButton = _buttonTextWithLoadingCircle();
        });
      }
      if (state.status == FormzStatus.submissionFailure) {
        setState(() {
          dialogPage = _showMyDialog(
              title: 'Form Error',
              description: 'Please check your form and try again.');
        });
      }
      if (state.isConnectionOn) {
        setState(() {
          signUpButton = const Text('Sign up');
        });
        buildSnackBar("No Internet Connection", Colors.red);
      }
    });
  }

  Row _buttonTextWithLoadingCircle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Sign Up "),
        SizedBox(
          width: 10,
        ),
        Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
      ],
    );
  }

  // Future createUser() async {
  Widget _signInButton() {
    return BlocConsumer<AuthBloc, AuthState>(listenWhen: (current, previous) {
      return current.isAuthScreenChange == previous.isAuthScreenChange;
    }, listener: (context, state) {
      if (state.status == FormzStatus.submissionSuccess) {
        Navigator.of(context).pushNamed('/main');
      }
      if (state.status == FormzStatus.submissionCanceled) {
        setState(() {
          dialogPage = _showMyDialog(
              title: 'User Already Exist',
              description: 'this email or username already exist.',
              description2: "try again with different email or username.");
        });
      }

      if (state.status == FormzStatus.submissionInProgress) {
        setState(() {
          signUpButton = _buttonTextWithLoadingCircle();
        });
      }
      if (state.status == FormzStatus.submissionFailure) {
        setState(() {
          dialogPage = _showMyDialog(
              title: 'Form Error',
              description: 'Please check your form and try again.');
        });
      }
      if (state.isConnectionOn) {
        setState(() {
          signUpButton = const Text('Sign up');
        });
        buildSnackBar("No Internet Connection", Colors.red);
      }
    }, buildWhen: (previous, current) {
      return previous.status == current.status;
    }, builder: (context, state) {
      return ElevatedButton(
          onPressed: state.status == FormzStatus.submissionSuccess
              ? null
              : () => BlocProvider.of<AuthBloc>(context).add(SignInSubmitted()),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Center(child: Text('Sign up'))));
    });
  }

  Widget _textLink(context, message, link) {
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: message,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              )),
          TextSpan(
              text: link,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    dialogPage = Container();
                  });
                  BlocProvider.of<AuthBloc>(context).add(FormCleaned());
                  BlocProvider.of<AuthBloc>(context)
                      .add(const AuthScreenChanged());

                  setState(() {
                    dialogPage = Container();
                  });
                },
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor)),
        ])));
  }

  _showMyDialog({title, description, description2 = ""}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(color: Colors.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
                Text(description2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                setState(() {
                  signUpButton = const Text('Sign up');
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void buildSnackBar(String append, Color color) {
    globalContext.currentState?.showSnackBar(SnackBar(
        duration: Duration(milliseconds: 1000),
        backgroundColor: color,
        content: Text(
          append,
          style: const TextStyle(color: Colors.white),
        )));
  }
}
