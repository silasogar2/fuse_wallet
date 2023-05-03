import 'package:fuse/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preference_helper.dart';

class Storage implements SharedPreferenceHelper {
  final SharedPreferences sharedPreferences;

  Storage(this.sharedPreferences);

  @override
  saveUserWalletAddress(String address) {
    sharedPreferences.setString(AppConstants.registeredUser, address);
  }

  @override
  String getUserWalletAddress() {
    return sharedPreferences.getString(AppConstants.registeredUser) ?? '';
  }
}
