import 'package:get/get.dart';

import '../../common/routes/routes.dart';
import 'state.dart';

class MessageController extends GetxController {
  MessageController();

  final state = MessageState();

  Future<void> goProfile() async {
    await Get.toNamed(AppRoutes.profile);
  }
}
