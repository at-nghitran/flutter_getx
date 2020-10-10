import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning/models/login_info.dart';
import 'package:learning/views/components/custom_alert.dart';
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
        CustomAlertDialog(),
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
