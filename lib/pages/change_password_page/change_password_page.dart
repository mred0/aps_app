import 'package:demo_tnd/pages/change_password_page/change_password_controller.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late ChangePasswordController _controller;

  @override
  void initState() {
    _controller = ChangePasswordController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            TextField(
              controller: _controller.oldPasswordTextField,
              decoration:
                  const InputDecoration(hintText: 'Enter Old Password Here...'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _controller.newPasswordTextField,
              decoration:
                  const InputDecoration(hintText: 'Enter New Password Here...'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _controller.confirmPasswordTextField,
              decoration: const InputDecoration(
                  hintText: 'Enter Confirm Password Here...'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Change Password'),
            )
          ],
        ),
      ),
    );
  }
}
