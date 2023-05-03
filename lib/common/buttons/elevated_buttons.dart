import 'package:flutter/material.dart';
import 'package:fuse/utils/constants/color_constants.dart';

import '../../utils/constants/app_constants.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.onPressMethod,
    this.color,
  });

  final Function onPressMethod;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressMethod();
      },
      style: ElevatedButton.styleFrom(backgroundColor: color ?? primaryColor),
      child: Text(AppConstants.getStartedButtonText),
    );
  }
}
