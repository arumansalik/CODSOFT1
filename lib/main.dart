import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/Colors/colors.dart';
import 'package:todo_list/ToDo/home_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('MyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primaryColor: Tcolor.primary));
  }
}
