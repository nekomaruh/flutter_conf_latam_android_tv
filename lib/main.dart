import 'package:flutter/material.dart';
import 'package:flutter_conf_android_tv/core/di/setup_di.dart';
import 'package:flutter_conf_android_tv/feature/movies/presentation/page/home_page.dart';

import 'core/framework/platform.dart';
import 'core/framework/remote_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();
  if (MyPlatform.isTVOS) {
    RemoteController().init();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}