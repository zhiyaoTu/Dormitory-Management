import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'app_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.actions,
  }) : super(key: key);

  final String title;
  final Widget body;
  final List<Widget>? actions;


  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.screenBgColor,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(
          context,
          title,
          actions: actions,
        ),
        body: body,
      ),
    );
  }
}
