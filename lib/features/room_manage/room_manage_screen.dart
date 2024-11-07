import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management/api_services/api_provider.dart';
import 'package:hostel_management/api_services/api_utils.dart';
import 'package:hostel_management/common/app_bar.dart';
import 'package:hostel_management/models/room_availability_model.dart';
import 'package:provider/provider.dart';

import '../../theme/colors.dart';
import '../../utils/utils.dart';
import 'views/room_edit_view.dart';
import 'widgets/room_card.dart';

class RoomManageScreen extends StatefulWidget {
  const RoomManageScreen({super.key});

  @override
  createState() => _RoomManageScreenState();
}

class _RoomManageScreenState extends State<RoomManageScreen> {
  RoomAvailability? roomAvailabile;

  Future<void> fetchData() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final roomAvailability =
          await apiProvider.getRequest(ApiUrls.roomAvailability);

      if (roomAvailability.statusCode == 200) {
        final Map<String, dynamic> room = json.decode(roomAvailability.body);
        logger.e(roomAvailability.body);

        roomAvailabile = RoomAvailability.fromJson(room);
      } else {
        logger.e('Failed to fetch data');
      }
    } catch (e) {
      logger.e('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        '宿舍管理',
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoomEditView(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return roomAvailabile == null
                ? const Center(
                    child: Text(
                      "No Availability",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: roomAvailabile!.result.length,
                      itemBuilder: (context, index) {
                        final room = roomAvailabile!.result[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: RoomCard(room: room),
                        );
                      },
                    ),
                  );
          }
        },
      ),
    );
  }
}
