import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controllers/login_controller.dart';
import 'package:learning/views/components/drawer.dart';

class HomePage extends StatelessWidget {
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${_loginController.loginInfo.value.email}'),
          Container(
            child: Center(
              child: OutlineButton(
                onPressed: () {
                  Get.offAllNamed('/login');
                },
                child: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
