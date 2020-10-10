import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning/models/login_info.dart';
import 'package:learning/views/pages/home.dart';

class LoginController extends GetxController {
  var loginInfo = LoginInfo(
    email: '',
    password: '',
  ).obs;
  var isSuccess = false.obs;
  var isDisabled = true.obs;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  onEmailChange() {
    checkDisable();
  }

  onPasswordChange() {
    checkDisable();
  }

  onLogin() {
    _validation();
  }

  _validation() {
    if (emailController.text.trim() != 'training@gmail.com' ||
        passwordController.text.trim() != '123456') {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          content: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Email or Password incorrect',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      isSuccess.value = true;
      loginInfo.value.email = emailController.text;
      loginInfo.value.password = passwordController.text;
      Get.off(HomePage());
    }
  }

  checkDisable() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      isDisabled.value = true;
    } else {
      isDisabled.value = false;
    }
  }
}
