import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/theme/colors.dart';

import '../../../gen/assets.gen.dart';
import '../../dormitory_list/dormitory_list_screen.dart';

class RoomsSummaryCard extends StatelessWidget {
  const RoomsSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _genderAvatar,
            SizedBox(height: 20.h),
            Text(
              '女生',
              style: TextStyle(
                height: 1.1,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _infoRow(
                    title: '空置',
                    count: 23,
                    unit: '个',
                    onPressed: () {
                      Navigator.push(
                          context, DormitoryListScreen.route(title: '空置一览'));
                    }),
                SizedBox(width: 10.w),
                _infoRow(
                  title: '在住',
                  count: 11,
                  unit: '个',
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _infoRow(
              title: '即将到期',
              count: 32,
              unit: '个',
            ),
            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       _switchRegionButton,
            //       const SizedBox(height: 5),
            //       Text(
            //         '切换区域',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  //
  // Widget get _switchRegionButton {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       shape: const CircleBorder(),
  //       padding: EdgeInsets.zero,
  //       backgroundColor: AppColors.kPrimaryColor,
  //     ),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         CupertinoPageRoute(
  //           builder: (context) => const RaiseIssueScreen(),
  //         ),
  //       );
  //     },
  //     child: const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Icon(
  //         Icons.swap_horiz,
  //         color: Colors.black,
  //         size: 50,
  //       ),
  //     ),
  //   );
  // }

  Widget get _genderAvatar {
    return ClipOval(
      child: SizedBox(
        height: 90.h,
        width: 90.w,
        child: Assets.images.lady.image(fit: BoxFit.fill),
      ),
    );
  }

  Widget _infoRow({
    required String title,
    required int count,
    required String unit,
    Function()? onPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$title:',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(width: 5.w),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: Text(
              '$count $unit',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
