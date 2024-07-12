import 'package:flutter/material.dart';

class ChangePasswordController {
  TextEditingController? oldPasswordTextField;
  TextEditingController? newPasswordTextField;
  TextEditingController? confirmPasswordTextField;
  
  @override
  void initState() {
    oldPasswordTextField = TextEditingController();
    newPasswordTextField = TextEditingController();
    confirmPasswordTextField = TextEditingController();
  }

  void dispose() {
    oldPasswordTextField?.dispose();
    newPasswordTextField?.dispose();

    confirmPasswordTextField?.dispose();
  }
}
