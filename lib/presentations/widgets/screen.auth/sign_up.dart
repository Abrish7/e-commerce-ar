import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _signUpForm();
  }

  Widget _signUpForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userNameField(),
              _emailField(),
              _passwordField(),
              _signUpButton()
            ],
          ),
        ));
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          icon: Icon(Icons.security), hintText: 'Password'),
      validator: (value) => null,
    );
  }

  Widget _emailField() {
    return TextFormField(
      obscureText: false,
      decoration:
          const InputDecoration(icon: Icon(Icons.email), hintText: 'Email'),
      validator: (value) => null,
    );
  }

  Widget _userNameField() {
    return TextFormField(
      obscureText: false,
      decoration: const InputDecoration(
          icon: Icon(Icons.perm_identity), hintText: 'Name'),
      validator: (value) => null,
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(onPressed: () {}, child: const Text('Sign up'));
  }
}
