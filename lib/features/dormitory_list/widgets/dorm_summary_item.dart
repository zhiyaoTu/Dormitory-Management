import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/gradient_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../theme/colors.dart';

class DormSummaryItem extends StatelessWidget {
  // TODO: to model
  final String manager;
  final String name;
  final String address;
  final int days;

  final Function() onTap;

  const DormSummaryItem({
    super.key,
    required this.manager,
    required this.name,
    required this.address,
    required this.days,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/avatar_placeholder.png'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      manager,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      address,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    // Assets.images.manIdent.image(width: 20, height: 20),
                  ],
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '可入住${days}人',
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                  Assets.images.ladyIdent.image(width: 20, height: 20),
                  SizedBox(height: 8),
                  GradientButton(
                    title: '详细',
                    onTap: onTap,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
