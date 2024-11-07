import 'package:flutter/material.dart';

import '../theme/colors.dart';

class GradientButton extends StatefulWidget {
  const GradientButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.radius = 20.0,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final double radius;

  @override
  createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        gradient: const LinearGradient(
          colors: [
            AppColors.kPrimaryColor,
            AppColors.kSecondaryColor,
          ],
        ),
      ),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius),
          ),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
