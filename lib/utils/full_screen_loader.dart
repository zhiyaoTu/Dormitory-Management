import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
