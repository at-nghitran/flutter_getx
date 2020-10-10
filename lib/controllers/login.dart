import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning/models/error.dart';
import 'package:learning/models/login_info.dart';

class LoginController extends GetxController {
  var loginInfo = LoginInfo(
    email: '',
    password: '',
  ).obs;
  LoginError error;
  var isSuccess = false.obs;
  var isDisabled = true.obs;
  var isError = false.obs;
  var email = ''.obs;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void onReady() {
    super.onReady();
  }

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
          actions: [
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Close'),
            ),
          ],
          title: Text('Error'),
        ),
      );
    } else {
      isSuccess.value = true;
      // Get.toNamed('/home');
      loginInfo.value.email = emailController.text;
      loginInfo.value.password = passwordController.text;
      Get.offAndToNamed('/home');
    }
    update();
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
