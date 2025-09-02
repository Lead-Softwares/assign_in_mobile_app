import 'package:assign_in/config/on_generate_route.dart';
// ignore: library_prefixes
import 'package:assign_in/config/theme_data.dart' as MainThemeData;
import 'package:assign_in/src/core/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavbar.routeName,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      theme: MainThemeData.lightThemeData(),

      title: 'Assign In',
    );
  }
}
