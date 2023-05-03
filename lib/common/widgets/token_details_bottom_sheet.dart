import 'package:flutter/material.dart';

import '../../common/widgets/truncated_address_input.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/helpers/display_utils.dart';
import '../../utils/helpers/size_config.dart';

class TokenDetailsBottomSheet extends StatelessWidget {
  const TokenDetailsBottomSheet({
    super.key,
    required this.result,
    required this.pa,
    required this.pb,
  });

  final result;
  final pa;
  final pb;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Token Details",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 23),
              ),
              Text(
                result.name,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Center(
          child: truncatedAddressInput(publicAddress: result.address),
        ),
        ListTile(
          title: Text("Total Supply"),
          trailing: Text(
            "${DisplayUtils.formatAmount(DisplayUtils.getExactValue(BigInt.parse(pa['result']), result.decimals)) + " " + result.symbol}",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        ListTile(
          title: Text("Balance in Token"),
          trailing: Text(
            "${DisplayUtils.formatAmount(DisplayUtils.getExactValue(BigInt.parse(pb['result']), result.decimals)) + " " + result.symbol}",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
        Center(
          child: SizedBox(
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
          ),
        )
      ],
    );
  }
}
