import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'presentation/address_input/controller/address_controller.dart';
import 'presentation/app/controller/app_controller.dart';
import 'presentation/app/view/app.dart';
import 'presentation/home/controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AddressController>(
        create: (_) => AddressController(),
      ),
      ChangeNotifierProvider<AppController>(
        create: (_) => AppController(),
      ),
      ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
      ),
    ],
    child: const App(),
  ));
}
