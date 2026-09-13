import 'package:flutter/material.dart';

import 'screens/route_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteInputScreen(),
    );
  }
}
