import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/names.dart';
import '../store/config.dart';
import '../store/user.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  RouteWelcomeMiddleware({required super.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.message);
    } else {
      return const RouteSettings(name: AppRoutes.signIn);
    }
  }
}
