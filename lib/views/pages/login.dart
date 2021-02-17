import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:learning/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  // final LoginController _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomInput(
              controller: Get.find<LoginController>().emailController,
              hintText: 'Email',
              prefixIcon: Icons.email,
              onChange: (value) {
                Get.find<LoginController>().onEmailChange();
              },
            ),
            SizedBox(height: 30),
            CustomInput(
              controller: Get.find<LoginController>().passwordController,
              hintText: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
              onChange: (value) {
                Get.find<LoginController>().onPasswordChange();
              },
            ),
            SizedBox(height: 50),
            Obx(
              () => OutlineButton(
                onPressed: Get.find<LoginController>().isDisabled.value
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();
                        Get.find<LoginController>().onLogin();
                      },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Function onChange;
  final bool obscureText;
  final TextEditingController controller;
  const CustomInput({
    Key key,
    this.hintText,
    this.prefixIcon,
    this.onChange,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 2,
            )
          ]),
      child: TextField(
        controller: controller,
        onChanged: (value) => onChange(value),
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 2,
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 2,
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 2,
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
