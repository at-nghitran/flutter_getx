import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning/models/login_info.dart';
import 'package:learning/views/components/custom_alert.dart';

class LoginController extends GetxController {
  final loginInfo = LoginInfo().obs;
  final isSuccess = false.obs;
  final isDisabled = true.obs;
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
    if (!emailController.text.trim().isEmail) {
      return Get.dialog(
        CustomAlertDialog(title: 'Email is not correct format'),
      );
    }
    if (emailController.text.trim() != 'training@gmail.com' ||
        passwordController.text.trim() != '123456') {
      return Get.dialog(
        CustomAlertDialog(title: 'Email or Password incorrect'),
      );
    } else {
      isSuccess.value = true;
      loginInfo.value.email = emailController.text;
      loginInfo.value.password = passwordController.text;
      return Get.offNamed('/home');
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
