import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/common.dart';
import 'dormitory_detail_screen.dart';
import 'widgets/dorm_summary_item.dart';
import 'widgets/group_section.dart';

class DormitoryListScreen extends StatefulWidget {
  const DormitoryListScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  static Route route({required String title}) => MaterialPageRoute(
        builder: (context) => DormitoryListScreen(title),
      );

  @override
  createState() => _DormitoryListScreenState();
}

class _DormitoryListScreenState extends State<DormitoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          GroupSection(
            groupName: '高田马场',
            people: [
              DormSummaryItem(
                manager: '陈燕',
                name: '高田马场1号宿舍',
                address: '高田马场2-7-11-205',
                days: 15,
                onTap: () {
                  Navigator.push(context, DormitoryDetailScreen.route(title: '高田马场1号宿舍'));
                },
              ),
              SizedBox(height: 20.h),
              DormSummaryItem(
                manager: '陈燕',
                name: '高田马场2号宿舍',
                address: '〒169-0075 東京都新宿区高田馬場１丁目２７−7',
                days: 23,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GroupSection(
            groupName: '莺谷',
            people: [
              DormSummaryItem(
                manager: '谢欣悦',
                name: '莺谷A宿舍',
                address: '〒110-0003 東京都台東区根岸３丁目４−5 ランダバウト東京 1階',
                days: 27,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
