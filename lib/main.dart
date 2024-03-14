import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0a0e21),
          appBarTheme: const AppBarTheme(
            color: Color(0xff0a0e21),
          )
          //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),

          ),
      home: InputPage(),
    );
  }
}
