import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:http/http.dart' as http;

import '../services/authentication_service.dart';

class DashboardController extends GetxController {
  final AuthenticationService authenticationService = AuthenticationService();
  final TextEditingController urlController = TextEditingController();

  TextEditingController getUrlController() {
    return urlController;
  }

  Future<void> downloadImage() async {
    try {
      String url = urlController.text.trim();
      if (url.isNotEmpty) {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await ImageGallerySaver.saveImage(response.bodyBytes);
          Get.snackbar(
            'Success',
            'Image saved successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          print('Failed to download image');
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  void pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      urlController.text = data.text!;
    }
  }

  Future<void> signOut() async {
    try {
      await authenticationService.handleSignOut();
      Get.offNamed('/');
    } catch (error) {
      print('Error during sign out: $error');
    }
  }
}
