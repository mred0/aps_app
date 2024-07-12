import 'package:flutter/material.dart';

class LoginpageController {
  TextEditingController? emailTextField;
  TextEditingController? passwordTextField;

  @override
  void initState() {
    emailTextField = TextEditingController();
    passwordTextField = TextEditingController();
  }

  void dispose() {
    emailTextField?.dispose();
    passwordTextField?.dispose();
  }
}
