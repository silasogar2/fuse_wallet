import 'package:flutter/foundation.dart';

abstract class AppProvider extends ChangeNotifier {
  late bool _isLoading;

  get isNetworkLoading => _isLoading;

  setNetworkLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }
}
