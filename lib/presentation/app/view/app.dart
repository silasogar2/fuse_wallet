import 'package:flutter/material.dart';

import '../../../utils/theme/different_color_theme.dart';
import '../../address_input/view/input_address_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fuse Wallet',
      theme: DifferentColorsTheme().lightTheme(),
      home: const InputWalletAddressScreen(),
    );
  }
}
