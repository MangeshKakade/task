import 'package:get/get.dart';
import '../src/pages/dashboard_page.dart';
import '../src/pages/register_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
    ),
    GetPage(
      name: '/',
      page: () => RegisterPage(),
    ),
  ];
}

