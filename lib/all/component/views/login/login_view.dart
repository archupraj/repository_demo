import 'package:diorepostry/all/component/interface/login/login_interface.dart';
import 'package:diorepostry/all/component/login/login_swich_btn.dart';
import 'package:diorepostry/all/component/model/user_model.dart';
import 'package:diorepostry/all/component/service/login/login_service.dart';
import 'package:diorepostry/all/component/views/home/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ILogin _loginservice = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: const [LoginSwitchButton()],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'E-mail'),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                textInputAction: TextInputAction.done,
                // onEditingComplete: () async {
                //   UserModel? user = await _loginservice.login(
                //       _emailController.text, _passwordController.text);

                //   if (user != null) {
                //     // ignore: use_build_context_synchronously
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(
                //         builder: (_) => HomeView(user: user),
                //       ),
                //     );
                //   } else {
                //     // Handle login failure or errors here
                //   }
                // },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    UserModel? user = await _loginservice.login(
                        _emailController.text, _passwordController.text);

                    if (user != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomeView(user: user),
                        ),
                      );
                    } else {
                      // Handle login failure or errors here
                    }
                  } else {
                    print('no data in text fields');
                    return null;
                  }
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      )),
    );
  }
}
