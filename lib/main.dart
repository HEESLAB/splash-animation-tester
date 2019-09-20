import 'package:flutter/material.dart';

import './pages/parameter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Animation Tester',
      theme: ThemeData(
        // primarySwatch: Colors.grey[700],
        primaryColor: Color(0xFFE0E0E0),
        buttonColor: Color(0xFF009688),
      ),
      home: ParameterPage(),
    );
  }
}
