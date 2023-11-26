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

  void pasteFromClipboard() async {
    print('Pasting from clipboard');
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null) {
      urlController.text = data.text!;
    }
  }

  Future<void> downloadImage() async {
    try {
      String url = urlController.text.trim();
      print('Downloading image from URL: $url'); // Add this log
      if (url.isNotEmpty) {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await ImageGallerySaver.saveImage(response.bodyBytes);
          print('Image saved successfully!'); // Add this log
          Get.snackbar(
            'Success',
            'Image saved successfully!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          print('Failed to download image: ${response.statusCode}'); // Add this log
        }
      } else {
        print('URL is empty'); // Add this log
      }
    } catch (e) {
      print('Error: $e'); // Add this log
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
