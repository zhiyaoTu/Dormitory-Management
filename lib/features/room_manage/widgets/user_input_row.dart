import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInputRow extends StatelessWidget {
  final TextEditingController controller;
  final int leftRatio;
  final int rightRatio;
  final int inputLimit;
  final bool isEnabled;
  final bool readOnly;
  final String title;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String hintText;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;

  const UserInputRow({
    super.key,
    required this.title,
    required this.controller,
    this.leftRatio = 1,
    this.rightRatio = 1,
    this.inputLimit = 100,
    this.isEnabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.hintText = "入力してください",
    this.textInputType = TextInputType.text,
    this.inputFormatters = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: leftRatio,
          child: Text(title),
        ),
        Expanded(
          flex: rightRatio,
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: TextField(
              textAlign: TextAlign.left,
              enabled: isEnabled,
              readOnly: readOnly,
              maxLines: 1,
              maxLength: inputLimit,
              keyboardType: textInputType,
              controller: controller,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
            ),
          ),
        ),
      ],
    );
  }
}
