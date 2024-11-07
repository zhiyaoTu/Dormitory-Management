import 'package:flutter/material.dart';

class GroupSection extends StatelessWidget {
  final String groupName;
  final List<Widget> people;

  GroupSection({required this.groupName, required this.people});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.arrow_drop_down_outlined),
              Text(
                groupName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ...people,
      ],
    );
  }
}
