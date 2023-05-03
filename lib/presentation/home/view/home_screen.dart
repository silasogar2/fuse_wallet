import 'package:flutter/material.dart';
import 'package:fuse/domain/data/app_service.dart';
import 'package:fuse/domain/fuse/fuse.dart';
import 'package:fuse/presentation/address_input/controller/address_controller.dart';
import 'package:fuse/presentation/home/controller/home_controller.dart';
import 'package:fuse/utils/constants/color_constants.dart';
import 'package:fuse/utils/helpers/size_config.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/public_address_bottom_sheet.dart';
import '../../../common/widgets/wallet_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService.getSavedWalletAddress(context);
    FuseSDK().fetchtokens("");
  }

  @override
  Widget build(BuildContext context) {
    final publicAddress = context.watch<AddressController>().savedWalletAddress;
    Provider.of<HomeController>(context, listen: false).updateTokenList();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          return await Provider.of<HomeController>(context, listen: false)
              .updateTokenList();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Balance",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$60",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 30),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "\$60 ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.green,
                                                        fontSize: 12)),
                                            const WidgetSpan(
                                              child: Icon(
                                                Icons.arrow_upward,
                                                size: 14,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  width: getProportionateScreenWidth(150),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          context: context,
                                          builder: (context) {
                                            return PublicAddressBottomSheet(
                                                publicAddress: publicAddress);
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: grayColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.black,
                                    ),
                                  )),
                              const Text("Receive")
                              // Text(
                              //     "Receive ${context.watch<AddressController>().savedWalletAddress}")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Consumer<HomeController>(
                                builder: (context, data, _) {
                              return Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: data.allTokens.length,
                                    itemBuilder: (context, i) {
                                      final result = data.allTokens[i];
                                      return WalletListItem(result: result);
                                    }),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
