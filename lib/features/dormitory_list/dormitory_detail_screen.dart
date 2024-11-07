import 'package:flutter/material.dart';

import '../../common/app_scaffold.dart';
import '../../gen/assets.gen.dart';
import '../../theme/colors.dart';

class DormitoryDetailScreen extends StatefulWidget {
  const DormitoryDetailScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  static Route route({required String title}) => MaterialPageRoute(
        builder: (context) => DormitoryDetailScreen(title),
      );

  @override
  createState() => _DormitoryListScreenState();
}

class _DormitoryListScreenState extends State<DormitoryDetailScreen> {
  final List<Map<String, dynamic>> facilities = [
    {'icon': Icons.bed, 'label': '整套房屋'},
    {'icon': Icons.local_parking, 'label': '免费停车'},
    {'icon': Icons.wifi, 'label': '无线网络'},
    {'icon': Icons.kitchen, 'label': '厨房'},
    {'icon': Icons.hot_tub, 'label': '独立卫浴'},
    // 添加更多设施...
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.images.dorm1.image(),
            Positioned(
              bottom: 10,
              left: 16,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  '南山区 海岸城保利广场',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '剩余1位',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '已减免 ¥190  今日钟点',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('优惠明细'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('05月25日 入住', style: TextStyle(fontSize: 14)),
                    Text('共3晚',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                Icon(Icons.arrow_forward),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('05月28日 退房', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
            Text('房屋设施',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: facilities.map((facility) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(facility['icon'], color: Colors.orange),
                    Text(
                      facility['label'],
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
