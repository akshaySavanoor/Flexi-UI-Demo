import 'package:flexi_ui/flexi_ui.dart';
import 'package:flexi_ui_demo/theme.dart';
import 'package:flutter/material.dart';

import 'flexi_ui_demo_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      ScreenAdaptiveConfig.init(
        context: context,
        orientation: orientation,
      );
      return AppRoot();
    });
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flexi UI Demo App.",
      theme: buildTheme(),
      home: FlexiUiDemoApp(),
    );
  }
}
