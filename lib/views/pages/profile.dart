import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controllers/login.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text('${_loginController.loginInfo.value.email}'),
            Text('${_loginController.loginInfo.value.password}')
          ],
        ),
      ),
    );
  }
}
