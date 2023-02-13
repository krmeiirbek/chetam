import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/apis/apis.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/store/store.dart';
import '../../../common/widgets/widgets.dart';
import 'state.dart';

class SignInController extends GetxController {
  SignInController();

  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  Future<void> handleSignIn(String type) async {
    //1: email, 2:google, 3:facebook, 4:apple, 5:phone number
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("... login with phone number ...");
        }
      } else if (type == "google") {
        GoogleSignInAccount? user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";

          LoginRequestEntity loginRequestEntity = LoginRequestEntity();
          loginRequestEntity.name = displayName;
          loginRequestEntity.email = email;
          loginRequestEntity.open_id = id;
          loginRequestEntity.avatar = photoUrl;
          loginRequestEntity.type = 2;
          if (kDebugMode) {
            print(jsonEncode(loginRequestEntity));
          }
          asyncPostAllData(loginRequestEntity);
        }
      } else {
        if (kDebugMode) {
          print("... login with some else");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
    if(result.code == 0){
      if (kDebugMode) {
        print("asyncPostAllData in sign in -> 0");
      }
      UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: 'Internet error');
    }
    Get.offAllNamed(AppRoutes.message);
  }
}
