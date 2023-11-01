import 'package:diorepostry/all/component/controllers/login_switch_controller.dart';
import 'package:diorepostry/all/component/views/login/login_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        theme:
            ThemeData(brightness: isDark ? Brightness.light : Brightness.dark),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginView(),
          // '/home': (_) => HomeView(user: user)
        },
      ),
    );
  }
}
