import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'note app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: background,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: primary,
              fontWeight: FontWeight.w600,
              fontSize: 32,
            )),
      ),
      home: const HomePage(),
    );
  }
}
