import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/token_details_bottom_sheet.dart';
import '../../presentation/home/controller/home_controller.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/helpers/display_utils.dart';

class WalletListItem extends StatelessWidget {
  const WalletListItem({
    super.key,
    required this.result,
  });

  final result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 2,
      onTap: () async {
        final pa = await Provider.of<HomeController>(context, listen: false)
            .fetchTokenTotalSupply(context, result.address);

        final pb = await Provider.of<HomeController>(context, listen: false)
            .fetchBalanceInToken(context, result.address);

        if (pa['status'] == "1" && pb['status'] == "1") {
          if (context.mounted) {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                return TokenDetailsBottomSheet(result: result, pa: pa, pb: pb);
              },
            );
          }
        } else {
          if (context.mounted) {
            return DisplayUtils.showCustomSnackbar(
              context,
              message: AppConstants.explorerError,
              icon: Icons.error,
              backgroundcolor: Colors.red,
              messagecolor: Colors.white,
              duration: const Duration(seconds: 4),
            );
          }
        }
      },
      leading: Image.asset('assets/images/icon.png'),
      title: Text(result.name),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "\$00",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${DisplayUtils.getExactValue(result.amount, result.decimals) + " " + result.symbol}",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
