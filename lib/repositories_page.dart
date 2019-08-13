import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RepositoriesPage extends StatelessWidget {

  static const kRouteName = '/repositories';

  static const _appBarTitle = 'Repositories';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(RepositoriesPage._appBarTitle),
        ),
        body: Center(child: Text("User name here")));
  }
}

