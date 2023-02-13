import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/values.dart';
import 'controller.dart';
import 'widgets/contact_list.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Contact",style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryText,
      ),),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        width: 360.w,
        height: 780.h,
        child: const ContactList(),
      ),
    );
  }
}
