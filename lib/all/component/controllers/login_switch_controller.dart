import 'package:diorepostry/all/component/interface/login/switch_button_interface.dart';
import 'package:diorepostry/all/component/model/login_switch_model.dart';
import 'package:diorepostry/all/component/service/login/login_switch_button.dart';
import 'package:flutter/foundation.dart';

class LoginSwitchController {
  LoginSwitchController._() {
    storage.getK('dark').then((val) {
      themeSwitch.value = val;
    });
  }
  static final instance = LoginSwitchController._();

  final config = LoginSwitchModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier get themeSwitch => config.themeSwitch;
  final ISwitchButton storage = SwitchButtonServices();

  Future<void> changeTheme(value) async {
    themeSwitch.value = value;
    storage.put('dark', value);
  }
}
