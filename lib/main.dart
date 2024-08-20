import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/pages/homepage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 10, 11, 1),
            foregroundColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(
              fontSize: 20,
            )),
        listTileTheme: ListTileThemeData(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            tileColor: const Color.fromARGB(200, 27, 27, 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                textStyle: const WidgetStatePropertyAll<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                padding: const WidgetStatePropertyAll<EdgeInsetsGeometry?>(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20)))),
      ),
      home: const MyHomePage(),
    );
  }
}
