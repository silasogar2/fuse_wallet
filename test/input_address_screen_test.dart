// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fuse/common/buttons/elevated_buttons.dart';
// import 'package:fuse/common/models/qr_code_model.dart';
// import 'package:fuse/presentation/address_input/view/input_address_screen.dart';
// import 'package:fuse/utils/constants/app_constants.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:provider/provider.dart';
// import '../lib/presentation/address_input/controller/address_controller.dart';
//
// class MockAddressController extends Mock implements AddressController {}
//
// class MockBuildContext extends Mock implements BuildContext {}
//
// class MockQrCodeModel extends Mock implements QrCodeModel {}
//
// void main() {
//   late AddressController mockAddressController;
//   late BuildContext mockContext;
//   setUpAll(() {
//     mockAddressController = MockAddressController();
//     mockContext = MockBuildContext();
//     // registerFallbackValue(mockContext);
//   });
//
//   group('InputWalletAddressScreen widget', () {
//     testWidgets('InputWalletAddressScreen', (WidgetTester tester) async {
//       // Mock dependencies
//       final mockAddressController = MockAddressController();
//
//       // Set up widget tree
//       await tester.pumpWidget(
//         MaterialApp(
//           home: MultiProvider(
//             providers: [
//               ChangeNotifierProvider<AddressController>.value(
//                   value: mockAddressController),
//             ],
//             child: const InputWalletAddressScreen(),
//           ),
//         ),
//       );
//
//       // Verify initial state
//       final getStartedInstruction =
//           find.text(AppConstants.getStartedInstruction);
//       final walletInputText = find.text(AppConstants.walletInputText);
//       expect(getStartedInstruction, findsOneWidget);
//       expect(walletInputText, findsOneWidget);
//
//       // Enter text into TextFormField
//       final textFormField = find.byType(TextFormField);
//       await tester.enterText(textFormField, 'wallet address');
//
//       // // Tap QR code icon button
//       final qrCodeButton = find.byIcon(Icons.qr_code);
//       await tester.tap(qrCodeButton);
//       await tester.pumpAndSettle();
//
//       // Mock QRCodeView and return successful result
//       final mockQRCodeModel = MockQrCodeModel();
//       when(() => mockQRCodeModel.isSuccessful).thenReturn(true);
//       when(() => mockQRCodeModel.qrCodeData).thenReturn('qr code data');
//     });
//   });
// }
