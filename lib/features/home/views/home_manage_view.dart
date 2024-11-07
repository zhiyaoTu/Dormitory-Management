import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/admin/screens/staff_display_screen.dart';
import 'package:hostel_management/models/student_info_model.dart';
import 'package:hostel_management/widgets/category_card.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors.dart';
import '../../room_manage/room_manage_screen.dart';

class HomeManageView extends StatefulWidget {
  const HomeManageView({Key? key}) : super(key: key);

  @override
  createState() => _HomeManageViewState();
}

class _HomeManageViewState extends State<HomeManageView> {
  StudentInfoModel? studentInfoModel;

  Future<void> fetchStudentDetails(String emailId) async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final studentInfo =
          await apiProvider.getRequest('${ApiUrls.studentDetails}$emailId');

      if (studentInfo.statusCode == 200) {
        final room = json.decode(studentInfo.body);

        studentInfoModel = StudentInfoModel.fromJson(room);
        ApiUrls.email = studentInfoModel!.result[0].studentProfileData.emailId;
        ApiUrls.phoneNumber = studentInfoModel!
            .result[0].studentProfileData.phoneNumber
            .toString();
        ApiUrls.roomNumber = studentInfoModel!
            .result[0].studentProfileData.roomNumber
            .toString();
        ApiUrls.username =
            studentInfoModel!.result[0].studentProfileData.userName;
        ApiUrls.blockNumber =
            studentInfoModel!.result[0].studentProfileData.block;
        ApiUrls.firstName =
            studentInfoModel!.result[0].studentProfileData.firstName;
        ApiUrls.lastName =
            studentInfoModel!.result[0].studentProfileData.lastName;
        ApiUrls.roleId =
            studentInfoModel!.result[0].studentProfileData.roleId.roleId;
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStudentDetails(ApiUrls.email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppColors.kPrimaryColor.withOpacity(0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpacer(20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '管理',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          heightSpacer(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryCard(
                category: '宿舍',
                image: AppConstants.roomChange,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RoomManageScreen(),
                    ),
                  );
                },
              ),
              // CategoryCard(
              //   category: 'All\nIssues',
              //   image: AppConstants.allIssues,
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       CupertinoPageRoute(
              //         builder: (context) => const IssueScreen(),
              //       ),
              //     );
              //   },
              // ),
              CategoryCard(
                category: '学生',
                image: AppConstants.staffMember,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const StaffInfoScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          heightSpacer(20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     CategoryCard(
          //       category: 'Create\nStaff',
          //       image: AppConstants.createStaff,
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           CupertinoPageRoute(
          //             builder: (context) => const CreateStaff(),
          //           ),
          //         );
          //       },
          //     ),
          //     CategoryCard(
          //       category: 'Hostel\nFee',
          //       image: AppConstants.hostelFee,
          //       onTap: () {
          //         ApiUrls.roleId != 2
          //             ? () {}
          //             : Navigator.push(
          //                 context,
          //                 CupertinoPageRoute(
          //                   builder: (context) => HostelFee(
          //                     blockNumber: studentInfoModel!
          //                         .result[0].studentProfileData.block,
          //                     roomNumber: studentInfoModel!
          //                         .result[0].studentProfileData.roomNumber
          //                         .toString(),
          //                     maintenanceCharge: studentInfoModel!
          //                         .result[0].roomChargesModel.maintenanceCharges
          //                         .toString(),
          //                     parkingCharge: studentInfoModel!
          //                         .result[0].roomChargesModel.parkingCharges
          //                         .toString(),
          //                     waterCharge: studentInfoModel!
          //                         .result[0].roomChargesModel.roomWaterCharges
          //                         .toString(),
          //                     roomCharge: studentInfoModel!
          //                         .result[0].roomChargesModel.roomAmount
          //                         .toString(),
          //                     totalCharge: studentInfoModel!
          //                         .result[0].roomChargesModel.totalAmount
          //                         .toString(),
          //                   ),
          //                 ),
          //               );
          //       },
          //     ),
          //     CategoryCard(
          //       category: 'Change\nRequests',
          //       image: AppConstants.roomChange,
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           CupertinoPageRoute(
          //             builder: (context) => const RoomChangeRequestScreen(),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          heightSpacer(20),
        ],
      ),
    );
  }
}
