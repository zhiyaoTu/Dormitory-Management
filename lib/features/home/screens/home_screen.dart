import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/constants.dart';
import 'package:hostel_management/common/spacing.dart';
import 'package:hostel_management/features/home/widgets/rooms_summary_card.dart';
import 'package:hostel_management/features/student/screens/profile_screen.dart';
import 'package:hostel_management/models/student_info_model.dart';
import 'package:hostel_management/theme/colors.dart';
import 'package:hostel_management/theme/text_theme.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../common/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StudentInfoModel? studentInfoModel;

  List<ChartData>? _chartData;

  Future<void> fetchStudentDetails(String emailId) async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final studentInfo =
          await apiProvider.getRequest('${ApiUrls.studentDetails}$emailId');

      if (studentInfo.statusCode == 200) {
        final Map<String, dynamic> room = json.decode(studentInfo.body);
        print(studentInfo.body);

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

  Future<void> fetchPieChartData() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiUrls.baseUrl}${ApiUrls.fetchPieChartData}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final roomChangeChart = data['result'][0]['roomChangeIssueChart'];

        setState(() {
          _chartData = [
            ChartData(
                label: 'Approved',
                value: roomChangeChart['totalRoomChangeRequestsApproved']
                    .toDouble(),
                color: Colors.green),
            ChartData(
                label: 'Rejected',
                value: roomChangeChart['totalRoomChangeRequestsRejected']
                    .toDouble(),
                color: Colors.red),
            ChartData(
                label: 'Pending',
                value: (roomChangeChart['totalNumberRoomChangeRequest'] -
                        roomChangeChart['totalRoomChangeRequestsApproved'] -
                        roomChangeChart['totalRoomChangeRequestsRejected'])
                    .toDouble(),
                color: Colors.grey),
          ];
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error appropriately
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStudentDetails(ApiUrls.email);
    fetchPieChartData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '寮App',
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ProfileScreen(
                    roomNumber: studentInfoModel
                            ?.result[0].studentProfileData.roomNumber
                            .toString() ??
                        "No Data",
                    blockNumber: studentInfoModel
                            ?.result[0].studentProfileData.block
                            .toString() ??
                        "No Data",
                    username: studentInfoModel
                            ?.result[0].studentProfileData.userName
                            .toString() ??
                        "No Data",
                    emailId: studentInfoModel
                            ?.result[0].studentProfileData.emailId
                            .toString() ??
                        "No Data",
                    phoneNumber: studentInfoModel
                            ?.result[0].studentProfileData.phoneNumber
                            .toString() ??
                        "No Data",
                    firstName: studentInfoModel
                            ?.result[0].studentProfileData.firstName
                            .toString() ??
                        "No Data",
                    lastName: studentInfoModel
                            ?.result[0].studentProfileData.lastName
                            .toString() ??
                        "No Data",
                  ),
                ),
              );
            },
            child: SvgPicture.asset(
              AppConstants.profile,
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _ladyRoomSummaryCard,
            ),
            heightSpacer(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _ladyRoomSummaryCard,
            ),
            // _chartData == null
            //     ? const CircularProgressIndicator()
            //     : ApiUrls.roleId == 2 || ApiUrls.roleId == 3
            //         ? const SizedBox.shrink()
            //         : SfCircularChart(
            //             series: <CircularSeries>[
            //               PieSeries<ChartData, String>(
            //                 dataSource: _chartData,
            //                 pointColorMapper: (ChartData data, _) => data.color,
            //                 xValueMapper: (ChartData data, _) => data.label,
            //                 yValueMapper: (ChartData data, _) => data.value,
            //                 dataLabelMapper: (ChartData data, _) =>
            //                     '${data.label}\n${data.value}',
            //                 dataLabelSettings: const DataLabelSettings(
            //                   isVisible: true,
            //                   labelPosition: ChartDataLabelPosition.outside,
            //                 ),
            //               ),
            //             ],
            //           ),
          ],
        ),
      ),
    );
  }

  Widget get _ladyRoomSummaryCard {
    return RoomsSummaryCard();
  }
}

class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData({required this.label, required this.value, required this.color});
}
