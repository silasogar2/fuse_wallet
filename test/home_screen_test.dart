// import 'dart:io';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:fuse/common/buttons/elevated_buttons.dart';
// import 'package:fuse/presentation/address_input/controller/address_controller.dart';
// import 'package:fuse/presentation/home/view/home_screen.dart';
// import 'package:fuse/utils/helpers/size_config.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:provider/provider.dart';
//
// class MockAddressController extends Mock implements AddressController {}
//
// class MockBuildContext extends Mock implements BuildContext {}
//
// void main() {
//   late AddressController addressController;
//   late MockBuildContext _mockContext;
//
//   setUpAll(() {
//     HttpOverrides.global = null;
//     addressController = MockAddressController();
//     _mockContext = MockBuildContext();
//   });
//
//   group('HomeScreen', () {
//     // testWidgets('should show balance and receive button',
//     //     (WidgetTester tester) async {
//     //   // await tester.runAsync(() async {
//     //   //   SizeConfig().init(_mockContext);
//     //   //   runApp(
//     //   //     MaterialApp(
//     //   //       home: MultiProvider(
//     //   //         providers: [
//     //   //           ChangeNotifierProvider<AddressController>.value(
//     //   //               value: AddressController()),
//     //   //         ],
//     //   //         child: const HomeScreen(),
//     //   //       ),
//     //   //     ),
//     //   //   );
//
//     //   //   expect(find.text('Your Balance'), findsOneWidget);
//     //   //   expect(find.text('\$60'), findsOneWidget);
//     //   //   expect(find.text('Receive'), findsOneWidget);
//     //   //   expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
//     //   // });
//     //   // arrange
//     //   // when(() => addressController.savedWalletAddress)
//     //   //     .thenReturn('mocked_address');
//
//     //   // act
//
//     //   await tester.pumpWidget(
//     //     MaterialApp(
//     //       home: MultiProvider(
//     //         providers: [
//     //           ChangeNotifierProvider<AddressController>.value(
//     //               value: AddressController()),
//     //         ],
//     //         child: const HomeScreen(),
//     //       ),
//     //     ),
//     //   );
//
//     //   SizeConfig().init(_mockContext);
//
//     //   expect(find.text('Your Balance'), findsOneWidget);
//     //   expect(find.text('\$60'), findsOneWidget);
//     //   expect(find.text('Receive'), findsOneWidget);
//     //   expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
//     // });
//
//     // testWidgets('should show list of tokens', (WidgetTester tester) async {
//     //   // arrange
//     //   when(() => addressController.savedWalletAddress)
//     //       .thenReturn('mocked_address');
//     //   when(() => addressController.allTokens)
//     //       .thenReturn(['mocked_token_1', 'mocked_token_2']);
//     //   final homeScreen = HomeScreen();
//
//     //   // act
//     //   await tester.pumpWidget(
//     //     MaterialApp(
//     //       home: MultiProvider(
//     //         providers: [
//     //           ChangeNotifierProvider<AddressController>.value(
//     //               value: addressController),
//     //         ],
//     //         child: const HomeScreen(),
//     //       ),
//     //     ),
//     //   );
//
//     //   // assert
//     //   expect(find.text('Fuse'), findsWidgets);
//     //   // expect(find.text('mocked_token_2'), findsWidgets);
//     // });
//
//     // testWidgets('should show bottom sheet on receive button press',
//     //     (WidgetTester tester) async {
//     //   // arrange
//     //   when(() => addressController.savedWalletAddress)
//     //       .thenReturn('mocked_address');
//     //   final homeScreen = HomeScreen();
//
//     //   // act
//     //   await tester.pumpWidget(
//     //     MaterialApp(
//     //       home: MultiProvider(
//     //         providers: [
//     //           ChangeNotifierProvider<AddressController>.value(
//     //               value: addressController),
//     //         ],
//     //         child: const HomeScreen(),
//     //       ),
//     //     ),
//     //   );
//     //   await tester.tap(find.byIcon(Icons.arrow_downward));
//     //   await tester.pumpAndSettle();
//
//     //   // assert
//     //   expect(find.text('Your Public Address'), findsOneWidget);
//     //   expect(find.text('mocked_address'), findsOneWidget);
//     //   expect(find.byType(ElevatedButton), findsOneWidget);
//     // });
//   });
// }
