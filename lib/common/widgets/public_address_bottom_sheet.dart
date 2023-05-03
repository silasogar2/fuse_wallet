import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/constants/color_constants.dart';
import '../../utils/helpers/size_config.dart';
import 'truncated_address_input.dart';

class PublicAddressBottomSheet extends StatelessWidget {
  const PublicAddressBottomSheet({
    super.key,
    required this.publicAddress,
  });

  final String publicAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Your public address",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 23),
        ),
        const SizedBox(
          height: 20,
        ),
        QrImage(
          data: publicAddress,
          version: QrVersions.auto,
          size: 180,
          gapless: false,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size(50, 50),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        truncatedAddressInput(publicAddress: publicAddress),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.info,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                  TextSpan(
                    text:
                        "Please make sure you are sending \n assets on the Fuse network",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(100),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              elevation: 0,
            ),
            child: Text("close"),
          ),
        )
      ],
    );
  }
}
