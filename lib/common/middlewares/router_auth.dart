import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../routes/names.dart';
import '../store/user.dart';

class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware({required super.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.signIn || route == AppRoutes.initial) {
      return null;
    } else {
      Future.delayed(
          const Duration(seconds: 2), () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: AppRoutes.signIn);
    }
  }
}
