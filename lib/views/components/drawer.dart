import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                width: double.infinity,
                color: Colors.black45,
                child: Text('Profile'),
              ),
              onTap: () {
                Get.toNamed('/profile');
              },
            )
          ],
        ),
      ),
    );
  }
}
