import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/student/screens/change_room_screen.dart';
import 'package:hostel_management/models/room_availability_model.dart';

import '../../../theme/colors.dart';

class RoomCard extends StatelessWidget {
  final Result room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
          ),
        ),
        shadows:  [
          BoxShadow(
            color: AppColors.kPrimaryColor.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(1, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                AppConstants.bed,
                height: 70.h,
                width: 70.w,
              ),
              Text(
                // 'Room no. - ${room.roomNumber}',
                '进门右手靠冰箱',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          widthSpacer(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '编号 ${room.blockId.block}',
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 16.sp,
                ),
              ),
              heightSpacer(5),
              Text(
                '可住人数: ${room.roomCapacity}',
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 16.sp,
                ),
              ),
              heightSpacer(5),
              Text(
                '当前人数: ${room.roomCurrentCapacity}',
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 16.sp,
                ),
              ),
              heightSpacer(5),
              if (room.roomType != null)
                Text(
                  '类型: ${room.roomType!.roomType}',
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16.sp,
                  ),
                ),
              heightSpacer(5),
              Row(
                children: [
                  Text(
                    '状态: ',
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 16.sp,
                    ),
                  ),
                  Container(
                    height: 30.h,
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
                    decoration: ShapeDecoration(
                      color: room.roomCurrentCapacity == 5
                          ? Colors.amber
                          : const Color(0xFF2ECC71),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8,
                          offset: Offset(1, 3),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: room.roomCurrentCapacity == 5
                        ? Text(
                            '使用中',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const ChangeRoomScreen(),
                                ),
                              );
                            },
                            child: Text(
                              '可用',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
