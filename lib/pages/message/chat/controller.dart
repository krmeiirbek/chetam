import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';
import 'state.dart';

class ChatController extends GetxController {
  ChatController();

  final state = ChatState();
  late String doc_id;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id']!;
    state.toToken.value = data['to_token'] ?? "";
    state.toName.value = data['to_name'] ?? "";
    state.toAvatar.value = data['to_avatar'] ?? "";
    state.toOnline.value = data['to_online'] ?? "1";
  }

  void goMore() {
    state.moreStatus(!state.moreStatus.value);
  }

  void audioCall() {
    state.moreStatus(false);
    Get.toNamed(
      AppRoutes.voiceCall,
      parameters: {
        "to_name":state.toName.value,
        "to_avatar":state.toAvatar.value,
      }
    );
  }
}
