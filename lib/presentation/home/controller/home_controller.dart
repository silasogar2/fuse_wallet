import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fuse/domain/data/api/api.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';

import '../../../domain/fuse/fuse.dart';
import '../../../utils/helpers/display_utils.dart';
import '../../address_input/controller/address_controller.dart';
import '../../app/controller/app_controller.dart';
// import '../../address_input/model/token_list_model.dart';

class HomeController extends AppController {
  dynamic _listOfTokens;
  get allTokens => _listOfTokens;

  updateTokenList({String? address}) async {
    final savedAddress = await AddressController().getSavedWalletAddress();
    address = address ?? savedAddress;
    var result = await FuseSDK().fetchtokens(address!);
    result.pick(onData: (TokenList tokenList) async {
      _listOfTokens = tokenList.result;
      notifyListeners();
    }, onError: (err) {
      throw err;
    });
  }

  Future<dynamic> fetchTokenTotalSupply(
      BuildContext context, String tokenAddress) async {
    var explorerUri = dotenv.env['EXPLORER_URL'];
    String uri =
        "$explorerUri?module=stats&action=tokensupply&contractaddress=$tokenAddress";
    try {
      DisplayUtils.showProgress(context);

      final result = await API.getRequest(uri);

      if (context.mounted) DisplayUtils.hideProgress(context);
      return result;
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

  Future<dynamic> fetchBalanceInToken(
      BuildContext context, String tokenAddress) async {
    var explorerUri = dotenv.env['EXPLORER_URL'];
    final savedAddress = await AddressController().getSavedWalletAddress();
    String uri =
        "$explorerUri?module=account&action=tokenbalance&contractaddress=$tokenAddress&address=$savedAddress";
    try {
      if (context.mounted) DisplayUtils.showProgress(context);
      final result = await API.getRequest(uri);
      if (context.mounted) DisplayUtils.hideProgress(context);
      return result;
    } catch (err) {
      if (context.mounted) {
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
}
