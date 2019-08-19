import 'package:flutter/material.dart';
import 'package:flutter_dojo/presenter/home_page.dart';
import 'package:flutter_dojo/presenter/repositories_page.dart';
import 'package:flutter_dojo/presenter/repository_detail_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        RepositoriesPage.kRouteName: (context) => RepositoriesPage(),
        RepositoryDetailPage.kRouteName: (context) => RepositoryDetailPage()
      },
    );
  }
}