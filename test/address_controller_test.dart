// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fuse/domain/data/shared_preference/storage.dart';
// import 'package:fuse/presentation/address_input/controller/address_controller.dart';
// import 'package:fuse/utils/helpers/helpers.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fuse_wallet_sdk/fuse_wallet_sdk.dart';
// import 'package:fuse/domain/fuse/fuse.dart';
//
// class MockHelpers extends Mock implements Helpers {}
//
// class MockSharedPreferences extends Mock implements SharedPreferences {}
//
// class MockStorage extends Mock implements Storage {}
//
// class MockFuseSDK extends Mock implements FuseSDK {}
//
// class MockBuildContext extends Fake implements BuildContext {}
//
// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   group('AddressController tests', () {
//     late AddressController addressController;
//     late MockHelpers mockHelpers;
//     late MockSharedPreferences mockSharedPreferences;
//     late MockStorage mockStorage;
//     late MockFuseSDK mockFuseSDK;
//     late BuildContext mockContext;
//
//     setUp(() {
//       mockHelpers = MockHelpers();
//       mockSharedPreferences = MockSharedPreferences();
//       mockStorage = MockStorage();
//       mockFuseSDK = MockFuseSDK();
//       addressController = AddressController();
//       mockContext = MockBuildContext();
//     });
//
//     test('updateScannedWalletAddress() should update scannedWalletAddress', () {
//       const walletAddress = '0x123456789';
//       addressController.updateScannedWalletAddress(walletAddress);
//       expect(addressController.scannedWalletAddress, equals(walletAddress));
//     });
//
//     // test('getSavedWalletAddress() should call Storage.getUserWalletAddress()',
//     //     () async {
//     //   when(() => mockHelpers.sharedPreferenceInstance())
//     //       .thenAnswer((_) => Future.value(mockSharedPreferences));
//     //   when(() => mockStorage.getUserWalletAddress())
//     //       .thenAnswer((_) => '0x123456789');
//
//     //   await addressController.getSavedWalletAddress();
//
//     //   expect(addressController.savedWalletAddress, equals('0x123456789'));
//     //   verify(() => mockStorage.getUserWalletAddress());
//     // });
//
//     // test(
//     //     'saveWalletAddress() should call FuseSDK.fetchtokens() and Storage.saveUserWalletAddress()',
//     //     () async {
//     //   const walletAddress = '0x123456789';
//     //   final tokenList =
//     //       TokenList(status: '200', message: '', result: <TokenDetails>[]);
//     //   final completer = Completer<void>();
//
//     //   // when(mockHelpers.sharedPreferenceInstance())
//     //   //     .thenAnswer((_) => Future.value(mockSharedPreferences));
//     //   when(() => mockStorage.saveUserWalletAddress(walletAddress))
//     //       .thenAnswer((_) => Future.value());
//     //   // when(mockFuseSDK.fetchtokens(walletAddress)).thenAnswer((_) {
//     //   //   completer.complete();
//     //   //   return Future.value(tokenList);
//     //   // });
//
//     //   addressController.saveWalletAddress(mockContext, walletAddress);
//
//     //   await completer.future;
//
//     //   expect(addressController.savedWalletAddress, equals(walletAddress));
//     //   expect(addressController.allTokens, equals(tokenList.result));
//     //   verify(mockFuseSDK.fetchtokens(walletAddress));
//     //   verify(() => mockStorage.saveUserWalletAddress(walletAddress));
//     // });
//   });
// }
