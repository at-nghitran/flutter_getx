import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controllers/login_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: GetX<LoginController>(
          builder: (_) => Column(
            children: [
              Text('${_.loginInfo.value.email}'),
              Text('${_.loginInfo.value.password}'),
            ],
          ),
        ),
      ),
    );
  }
}
