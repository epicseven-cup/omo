import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omo_client/common/screens/home_screen.dart';
import 'package:omo_client/common/widgets/NavigationMenu.dart';
import 'package:omo_client/common/widgets/NavigationMenuItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'omo client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomeScreen(title: 'omo client'),
    );
  }
}

