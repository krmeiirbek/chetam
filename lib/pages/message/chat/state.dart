import 'package:get/get.dart';

import '../../../common/entities/entities.dart';

class ChatState {
  final msgContentList = <MsgContent>[].obs;

  final toToken = "".obs;
  final toName = "".obs;
  final toAvatar = "".obs;
  final toOnline = "".obs;
  final moreStatus = false.obs;
}