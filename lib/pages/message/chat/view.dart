import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/values.dart';

import 'controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      title: Obx(
        () => Container(
          child: Text(
            '${controller.state.toName}',
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.primarySecondaryBackground,
                  borderRadius: BorderRadius.circular(22.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: controller.state.toAvatar.value,
                  width: 44.w,
                  height: 44.h,
                  imageBuilder: (ctx, img) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.h),
                      image: DecorationImage(
                        image: img,
                      ),
                    ),
                  ),
                  errorWidget: (ctx, url, err) =>
                      Image.asset("assets/images/account_header.png"),
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
                    color: controller.state.toOnline.value == "1"
                        ? AppColors.primaryElementStatus
                        : AppColors.primarySecondaryElementText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() => SafeArea(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 360.w,
                    padding:
                        EdgeInsets.only(left: 20.w, bottom: 10.h, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 270.w,
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBackground,
                            border: Border.all(
                                color: AppColors.primarySecondaryElementText),
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 220.w,
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'Message...',
                                    contentPadding: EdgeInsets.only(
                                        left: 15.w, bottom: 0, top: 0),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintStyle: const TextStyle(
                                      color:
                                          AppColors.primarySecondaryElementText,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  child: Image.asset('assets/icons/send.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.goMore();
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              borderRadius: BorderRadius.circular(20.w),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Image.asset('assets/icons/add.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                controller.state.moreStatus.value
                    ? Positioned(
                        right: 20.w,
                        bottom: 70.h,
                        height: 200.h,
                        width: 40.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.circular(20.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/icons/file.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.circular(20.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/icons/photo.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.audioCall();
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.circular(20.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/icons/call.png'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBackground,
                                  borderRadius: BorderRadius.circular(20.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/icons/video.png'),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}
