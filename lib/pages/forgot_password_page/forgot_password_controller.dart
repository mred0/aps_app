import 'package:flutter/material.dart';

class ForgotPasswordController {
  TextEditingController? emailTextField;

  @override
  void initState() {
    emailTextField = TextEditingController();
  }

  void dispose() {
    emailTextField?.dispose();
  }
}
