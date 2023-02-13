import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/apis/apis.dart';
import '../../common/entities/entities.dart';
import '../../common/routes/routes.dart';
import '../../common/store/store.dart';
import 'state.dart';

class ContactController extends GetxController {
  ContactController();

  final state = ContactState();
  final token = UserStore.to.profile.token;
  final db = FirebaseFirestore.instance;

  @override
  void onReady() {
    super.onReady();
    asyncLoadData();
  }

  asyncLoadData() async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      indicator: const CircularProgressIndicator(),
      dismissOnTap: true,
    );
    state.contactList.clear();
    var result = await ContactAPI.postContact();
    print(result.data!);
    if (result.code == 0) {
      state.contactList.addAll(result.data!);
    }
    EasyLoading.dismiss();
  }

  Future<void> goChat(ContactItem contactItem) async {
    var fromMessages = await db
        .collection("message")
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where("from_token", isEqualTo: token)
        .where("to_token", isEqualTo: contactItem.token)
        .get();
    if (kDebugMode) {
      print("fromMessages is ${fromMessages.docs.isEmpty}");
    }
    var toMessages = await db
        .collection("message")
        .withConverter(
          fromFirestore: Msg.fromFirestore,
          toFirestore: (Msg msg, options) => msg.toFirestore(),
        )
        .where("from_token", isEqualTo: contactItem.token)
        .where("to_token", isEqualTo: token)
        .get();
    if (kDebugMode) {
      print("toMessages is ${toMessages.docs.isEmpty}");
    }

    if (fromMessages.docs.isEmpty && toMessages.docs.isEmpty) {
      var profile = UserStore.to.profile;
      var msgData = Msg(
        from_token: profile.token,
        to_token: contactItem.token,
        from_name: profile.name,
        to_name: contactItem.name,
        from_avatar: profile.avatar,
        to_avatar: contactItem.avatar,
        from_online: profile.online,
        to_online: contactItem.online,
        last_msg: "",
        last_time: Timestamp.now(),
        msg_num: 0,
      );

      var docId = await db
          .collection("message")
          .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore(),
          )
          .add(msgData);

      Get.offNamed(AppRoutes.chat, parameters: {
        "doc_id": docId.id,
        "to_token": contactItem.token ?? "",
        "to_name": contactItem.name ?? "",
        "to_online": contactItem.online.toString(),
        "to_avatar": contactItem.avatar ?? "",
      });
    } else {
      if (fromMessages.docs.isNotEmpty) {
        Get.offNamed(AppRoutes.chat, parameters: {
          "doc_id": fromMessages.docs.first.id,
          "to_token": contactItem.token ?? "",
          "to_name": contactItem.name ?? "",
          "to_online": contactItem.online.toString(),
          "to_avatar": contactItem.avatar ?? "",
        });
      }

      if (toMessages.docs.isNotEmpty) {
        Get.offNamed(AppRoutes.chat, parameters: {
          "doc_id": toMessages.docs.first.id,
          "to_token": contactItem.token ?? "",
          "to_name": contactItem.name ?? "",
          "to_online": contactItem.online.toString(),
          "to_avatar": contactItem.avatar ?? "",
        });
      }
    }
  }
}
