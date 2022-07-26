import 'package:flutter/material.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String labelText = '',
      String hintText = '',
      String errorMessage = '',
      bool isError = false,
      Icon icon = const Icon(Icons.disabled_by_default),
      suffix]) {
    return InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffix,
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        errorText: isError ? errorMessage : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: isError
                ? const BorderSide(color: Colors.red)
                : const BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: isError
                ? const BorderSide(color: Colors.red)
                : BorderSide(color: Colors.grey.shade300)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.red, width: 1)));
  }

  InputDecoration searchInputDecoration(
      [String labelText = '',
      String hintText = '',
      String errorMessage = '',
      bool isError = false,
      Icon icon = const Icon(Icons.disabled_by_default),
      suffix]) {
    return InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffix,
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        errorText: isError ? errorMessage : null,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: isError
                ? const BorderSide(color: Colors.red)
                : const BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: isError
                ? const BorderSide(color: Colors.red)
                : BorderSide(color: Colors.grey.shade300)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: Colors.red, width: 1)));
  }

  InputDecoration otpInputDecoration(
      [String labelText = '', String hintText = '']) {
    return InputDecoration(
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '+251',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        labelText: labelText,
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(10, 10, 20, 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red, width: 1)));
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = '', String color2 = '']) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [Colors.red, Colors.blue]),
        color: Colors.blue);
  }

  BoxDecoration createButtonBoxDecoration(BuildContext context,
      [String color1 = '', String color2 = '']) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).accentColor;

    if (color1.isEmpty) {
      c1 = Colors.white;
    }
    if (color2.isEmpty) {
      c2 = Colors.grey.shade300;
    }
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [c1, c2]),
        color: Colors.lightBlue);
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      minimumSize: MaterialStateProperty.all(const Size(10, 10)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  ButtonStyle buttonStyle2() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      minimumSize: MaterialStateProperty.all(const Size(30, 30)),
      backgroundColor: MaterialStateProperty.all(Colors.grey),
      shadowColor: MaterialStateProperty.all(Colors.black),
    );
  }
}

class LoginFormStyle {}
