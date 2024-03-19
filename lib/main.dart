import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/aarti_controller.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/screen_index_provider.dart';
import 'package:shinde_tech_aarti_sangrah/firebase_options.dart';
import 'package:shinde_tech_aarti_sangrah/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AartiController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreenIndexProvider(),
        ),
      ],
      child: GetMaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.redAccent),
      ),
    );
  }
}
