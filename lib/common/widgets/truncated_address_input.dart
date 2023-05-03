import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/color_constants.dart';
import '../../utils/helpers/display_utils.dart';

class truncatedAddressInput extends StatelessWidget {
  const truncatedAddressInput({
    super.key,
    required this.publicAddress,
  });

  final String publicAddress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: publicAddress))
            .then((value) {
          DisplayUtils.showCustomSnackbar(context,
              message: "Address copied",
              icon: Icons.copy,
              backgroundcolor: Colors.green,
              messagecolor: Colors.white,
              duration: const Duration(seconds: 4));
        });
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
        child: Container(
          color: grayColor,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 20, right: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: Icon(Icons.copy, size: 24),
                  ),
                  TextSpan(
                    text: "${DisplayUtils.truncateAddress(publicAddress)}",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
