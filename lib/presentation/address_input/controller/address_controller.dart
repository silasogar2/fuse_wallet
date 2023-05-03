import 'package:flutter/material.dart';
import 'package:fuse/presentation/home/controller/home_controller.dart';

import '../../../common/provider/app_provider.dart';
import '../../../domain/data/shared_preference/storage.dart';
import '../../../utils/helpers/display_utils.dart';
import '../../../utils/helpers/helpers.dart';
import '../../home/view/home_screen.dart';

class AddressController extends AppProvider {
  String? _scannedWalletAddress;
  String? _savedWalletAddress;

  String get scannedWalletAddress => _scannedWalletAddress ?? '';
  String get savedWalletAddress => _savedWalletAddress ?? '';

  updateScannedWalletAddress(String walletAddress) {
    _scannedWalletAddress = walletAddress;
    notifyListeners();
  }

  getSavedWalletAddress() async {
    var sharedPreference = await Helpers().sharedPreferenceInstance();
    _savedWalletAddress = Storage(sharedPreference).getUserWalletAddress();
    notifyListeners();
    return _savedWalletAddress;
  }

  saveWalletAddress(BuildContext context, String address) async {
    DisplayUtils.showProgress(context);
    try {
      await HomeController().updateTokenList(address: address);
      var sharedPreference = await Helpers().sharedPreferenceInstance();
      Storage(sharedPreference).saveUserWalletAddress(address);
      if (context.mounted) {
        DisplayUtils.hideProgress(context);
        Navigator.push(
            context, Helpers().animateFuseScreen(const HomeScreen()));
      }
    } catch (err) {
      DisplayUtils.hideProgress(context);
      return DisplayUtils.showCustomSnackbar(
        context,
        message: err.toString(),
        icon: Icons.error,
        backgroundcolor: Colors.red,
        messagecolor: Colors.white,
        duration: const Duration(seconds: 4),
      );
    }
  }
}
