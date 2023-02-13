import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/entities/entities.dart';
import '../../../common/values/values.dart';
import '../controller.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({Key? key}) : super(key: key);

  Widget _buildListItem(ContactItem contactItem) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.primarySecondaryBackground,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          controller.goChat(contactItem);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                imageUrl: contactItem.avatar!,
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
              ),
            ),
            Container(
              width: 275.w,
              padding:
                  EdgeInsets.only(left: 10.w, top: 10.h, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.h,
                    child: Text(
                      '${contactItem.name}',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.thirdElement,
                        fontSize: 16.sp,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                  Container(
                    width: 12.w,
                    height: 12.h,
                    margin: EdgeInsets.only(top: 5.h),
                    child: Image.asset("assets/icons/ang.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return _buildListItem(controller.state.contactList[index]);
                  },
                  childCount: controller.state.contactList.length,
                ),
              ),
            ),
          ],
        ));
  }
}
