import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/values.dart';
import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.circular(60.h),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Image(
            image: AssetImage("assets/images/account_header.png"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          height: 35.w,
          child: GestureDetector(
            child: Container(
              width: 35.w,
              height: 35.h,
              padding: EdgeInsets.all(7.h),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(18.h),
              ),
              child: Image.asset("assets/icons/edit.png"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(
          top: 60.h,
          bottom: 30.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: "Are your sure to logout? ",
          content: const SizedBox.shrink(),
          textConfirm: "Confirm",
          textCancel: "Cancel",
          confirmTextColor: Colors.white,
          onConfirm: () {
            controller.goLogout();
          },
          onCancel: (){

          }
        );
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(
          bottom: 30.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    _buildProfilePhoto(),
                    _buildCompleteBtn(),
                    _buildLogoutBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
