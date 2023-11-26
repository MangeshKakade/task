import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/notification_data.dart';
import '../services/authentication_service.dart';
import '../viewmodel/notification_viewmodel.dart';

class RegisterController extends GetxController with WidgetsBindingObserver {
  final AuthenticationService authenticationService = AuthenticationService();
  final RxBool isLoading = false.obs;
  late NotificationViewModel _notificationViewModel;
  Timer? _notificationTimer;
  bool _appInForeground = true;

  @override
  void onInit() {
    super.onInit();
    _notificationViewModel = NotificationViewModel();
    _notificationViewModel.initNotifications();
    _startNotificationTimer();

    // Add this line to register the observer
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _appInForeground = true;
    } else {
      _appInForeground = false;
    }
  }

  void _startNotificationTimer() {
    const fiveSeconds = Duration(seconds: 5);

    _notificationTimer?.cancel();

    _notificationTimer = Timer.periodic(fiveSeconds, (timer) {
      if (!_appInForeground) {
        _notificationViewModel.showNotification(NotificationData(
          title: 'Hello Notification',
          body: 'Hello from the app!',
        ));
      }
    });
  }

  Future<void> registerWithGoogle() async {
    try {
      isLoading.value = true;
      await authenticationService.handleGoogleSignIn();
      Get.offNamed('/dashboard');
    } catch (error) {
      print('Error during Google Sign-In: $error');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
