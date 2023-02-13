import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/values.dart';
import '../../common/routes/routes.dart';
import 'controller.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({Key? key}) : super(key: key);

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.h,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.goProfile();
                  },
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(22.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: controller.state.headDetail.value.avatar == null
                        ? Image(
                            image:
                                AssetImage('assets/images/account_header.png'))
                        : Text("Hi"),
                  ),
                ),
                Positioned(
                  bottom: 5.h,
                  right: 0,
                  height: 14.h,
                  child: Container(
                    height: 14.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: AppColors.primaryElementText,
                      ),
                      borderRadius: BorderRadius.circular(7.h),
                      color: AppColors.primaryElementStatus,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: _headBar(),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.toNamed(AppRoutes.contact);
        },
        child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: const Icon(Icons.message_outlined,color: Colors.white,),
            )),
      ),
    );
  }
}
