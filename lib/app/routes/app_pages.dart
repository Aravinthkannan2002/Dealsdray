import 'package:get/get.dart';

import 'package:chatapp/app/modules/bottombartmplt/bindings/bottombartmplt_binding.dart';
import 'package:chatapp/app/modules/bottombartmplt/views/bottombartmplt_view.dart';
import 'package:chatapp/app/modules/homepage/bindings/homepage_binding.dart';
import 'package:chatapp/app/modules/homepage/views/homepage_view.dart';
import 'package:chatapp/app/modules/login/bindings/login_binding.dart';
import 'package:chatapp/app/modules/login/views/login_view.dart';
import 'package:chatapp/app/modules/otplogin/bindings/otplogin_binding.dart';
import 'package:chatapp/app/modules/otplogin/views/otplogin_view.dart';
import 'package:chatapp/app/modules/register/bindings/register_binding.dart';
import 'package:chatapp/app/modules/register/views/register_view.dart';
import 'package:chatapp/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:chatapp/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.STATUS,
      page: () => StatusView(),
      binding: StatusBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.OTPLOGIN,
      page: () => OtploginView(),
      binding: OtploginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBARTMPLT,
      page: () => BottombartmpltView(),
      binding: BottombartmpltBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
