import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 100,
                      color: Colors.black,
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 100,
                      color: Colors.black,
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                      () => Stack(
                    alignment: Alignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: registerController.isLoading.value
                            ? null
                            : () {
                          registerController.registerWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        icon: Icon(Icons.g_mobiledata_rounded),
                        label: Text('Sign in with Google'),
                      ),
                      Visibility(
                        visible: registerController.isLoading.value,
                        child: SpinKitCircle(
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
