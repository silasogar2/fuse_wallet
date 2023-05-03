import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';

class FuseSDK {
  static String secret = dotenv.env['PUBLIC_KEY'].toString();

  final FuseWalletSDK fuseWalletSDK = FuseWalletSDK(secret);

  fetchtokens(String walletAddress) async {
    var result = await fuseWalletSDK.explorerModule.getTokenList(walletAddress);
    return result;
  }
}
