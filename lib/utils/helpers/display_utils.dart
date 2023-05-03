import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../constants/color_constants.dart';

class DisplayUtils {
  static dynamic showProgress(BuildContext context) {
    return Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      isSafeAreaOverlay: true,
      progressIndicator: const SpinKitFadingFour(
        color: primaryColor,
      ),
      overlayColor: Colors.blueGrey.withOpacity(0.5),
    );
  }

  static dynamic hideProgress(BuildContext context) {
    Loader.hide();
  }

  static getExactValue(BigInt value, int decimalPlacement) {
    if (decimalPlacement == 0) {
      return value;
    }

    return Decimal.parse(
            (value / BigInt.from(10).pow(decimalPlacement)).toString())
        .toStringAsFixed(2)
        .toString();
  }

  static getExactValueFromString(String value, int decimalPlacement) {
    return Decimal.parse(value) /
        Decimal.parse(pow(10, decimalPlacement).toString());
  }

  static formatAmount(String amount) {
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(double.parse(amount));
  }

  static truncateAddress(String address) {
    final firstPart = address.substring(0, 4);
    final lastPart = address.lastChars(4);
    return ("$firstPart...$lastPart");
  }

  static void showCustomSnackbar(BuildContext context,
      {required String message,
      required IconData icon,
      required Color backgroundcolor,
      required Color messagecolor,
      required Duration duration}) {
    Flushbar(
      message: message,
      icon: Icon(icon, size: 28.0, color: messagecolor),
      backgroundColor: backgroundcolor,
      messageColor: messagecolor,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: duration,
    ).show(context);
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}
