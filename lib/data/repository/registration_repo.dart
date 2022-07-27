import 'package:ecommerce_v3/data/provider/registration_api.dart';

class RegistrationRepository {
  RegistrationApi registrationApi = RegistrationApi();

  Future<String> postUserData(
      {required String firstname,
      required String lastname,
      required String username,
      required String email,
      required String password,
      required String confirmPassword}) {
    return registrationApi.createUser(
        firstname: firstname,
        lastname: lastname,
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword);
  }
}
