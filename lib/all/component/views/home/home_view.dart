import 'package:diorepostry/all/component/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final UserModel user;
  const HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.user.email),
          Text(widget.user.token),
        ],
      )),
    );
  }
}
