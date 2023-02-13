import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:chetam/common/store/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/values/values.dart';
import 'state.dart';

class VoiceCallController extends GetxController {
  VoiceCallController();

  final state = VoiceCallState();
  final player = AudioPlayer();
  final appId = appID;
  final db = FirebaseFirestore.instance;
  final profileToken = UserStore.to.profile.token;
  late final RtcEngine engine;
  final channelProfileType = ChannelProfileType.channelProfileCommunication1v1;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    state.toName.value = data['to_name'] ?? "";
    state.toAvatar.value = data['to_avatar'] ?? "";
    initEngine();
  }

  Future<void> initEngine() async {
    await player.setAsset('assets/Sound_Horizon.mp3');
    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(appId: appId));
    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        print('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        print('onConnection ${connection.toJson()}');
        state.isJoined(true);
      },
      onUserJoined: (connection, remoteUid, elapsed) async {
        await player.pause();
      },
      onLeaveChannel: (connection, stats) {
        print('... user left the room...');
        state.isJoined(false);
      },
      onRtcStats: (connection, stats) {
        print('...time');
        print(stats.duration);
      },
    ));
    await engine.enableAudio();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.setAudioProfile(
      profile: AudioProfileType.audioProfileDefault,
      scenario: AudioScenarioType.audioScenarioGameStreaming,
    );
    joinChannel();
  }

  Future<void> joinChannel() async {
    await Permission.microphone.request();
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    await engine.joinChannel(
      token: "007eJxTYBCabaBv1p3h2SmsxnhN8RSb2KK/y99WGs9gVJ4j94ZV9IACQ6KlaZqlgYW5uXFKsklKioGlsalJWpqpuZmJqYlBkrG515EXyQ2BjAxCZTnMjAwQCOKzMSRnpJYk5jIwAABMqRww",
      channelId: "chetam",
      uid: 0,
      options: ChannelMediaOptions(
        channelProfile: channelProfileType,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    EasyLoading.dismiss();
  }

  Future<void> leaveChannel() async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    await player.pause();
    state.isJoined(false);
    EasyLoading.dismiss();
    Get.back();
  }
}
