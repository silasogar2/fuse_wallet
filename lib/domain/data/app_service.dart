import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/address_input/controller/address_controller.dart';

class AppService {
  static getSavedWalletAddress(BuildContext context) async {
    await Provider.of<AddressController>(context, listen: false)
        .getSavedWalletAddress();
  }
}
