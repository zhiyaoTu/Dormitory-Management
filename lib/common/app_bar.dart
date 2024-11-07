import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';

AppBar buildAppBar(
  BuildContext context,
  String? title, {
  List<Widget>? actions,
}) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.kPrimaryColor,
            AppColors.kSecondaryColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    ),
    // backgroundColor: AppColors.kPrimaryColor,
    elevation: 0,
    actions: actions,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
    ),
    title: Text(
      title ?? "Registration",
      style: AppTextTheme.kLabelStyle.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
