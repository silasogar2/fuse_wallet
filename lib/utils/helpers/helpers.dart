import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  PageRouteBuilder<dynamic> animateFuseScreen(Widget newScreen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return newScreen;
      },
      transitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(curve: Curves.easeInOut, parent: animation);
        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: child,
          ),
        );
      },
    );
  }

  sharedPreferenceInstance() async {
    return await SharedPreferences.getInstance();
  }
}
