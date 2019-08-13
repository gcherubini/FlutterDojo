import 'package:flutter/material.dart';
import 'package:flutter_dojo/home_page.dart';
import 'package:flutter_dojo/repositories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dojo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RepositoriesPage.routeName: (context) => RepositoriesPage()
      },
    );
  }
}