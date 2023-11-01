import 'package:diorepostry/all/component/controllers/login_switch_controller.dart';
import 'package:flutter/material.dart';

class LoginSwitchButton extends StatelessWidget {
  const LoginSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: false,
        onChanged: (value) {
          LoginSwitchController.instance.changeTheme(value);
        });
  }
}
