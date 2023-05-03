import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/buttons/elevated_buttons.dart';
import '../../../common/models/qr_code_model.dart';
import '../../../common/qrcode/qr_code_view.dart';
import '../../../utils/constants/app_constants.dart';
import '../../../utils/helpers/display_utils.dart';
import '../../../utils/helpers/size_config.dart';
import '../../../utils/theme/app_theme.dart';
import '../controller/address_controller.dart';

class InputWalletAddressScreen extends StatefulWidget {
  const InputWalletAddressScreen({Key? key}) : super(key: key);

  @override
  State<InputWalletAddressScreen> createState() =>
      _InputWalletAddressScreenState();
}

class _InputWalletAddressScreenState extends State<InputWalletAddressScreen> {
  final TextEditingController _walletAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var theme = AppTheme.of(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ElevatedButtonWidget(onPressMethod: () async {
          await Provider.of<AddressController>(context, listen: false)
              .saveWalletAddress(context, _walletAddressController.text);
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(140)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(AppConstants.letsGetStarted, style: theme.bodyText1),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppConstants.getStartedInstruction,
                style: theme.title1,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _walletAddressController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.qr_code),
                    onPressed: () async {
                      var qrCodeData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QRCodeView()),
                      ) as QrCodeModel?;
                      if (qrCodeData != null) {
                        print("I received a set of data");
                        if (qrCodeData.isSuccessful) {
                          _walletAddressController.text =
                              qrCodeData.qrCodeData!;
                        } else {
                          if (context.mounted) {
                            DisplayUtils.showCustomSnackbar(
                              context,
                              message: AppConstants.unableToGetQRCode,
                              icon: Icons.error,
                              backgroundcolor: Colors.red,
                              messagecolor: Colors.white,
                              duration: const Duration(seconds: 4),
                            );
                          }
                        }
                      }
                    },
                  ),
                  label: Text(
                    AppConstants.walletInputText,
                    style: theme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
