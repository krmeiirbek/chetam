import 'package:get/get.dart';


class VoiceCallState {
  final isJoined = false.obs;
  final openMicrophone = true.obs;
  final enableSpeaker = true.obs;
  final callTime = "00.00".obs;
  final callTimeStatus = "not connected".obs;

  final toToken = "".obs;
  final toAvatar = "".obs;
  final toName = "".obs;
  final docId = "".obs;
  final callRole = "audience".obs;
}