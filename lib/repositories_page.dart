import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepositoriesPageArguments {
  final String userName;

  RepositoriesPageArguments(this.userName);
}

class RepositoriesPage extends StatelessWidget {

  static const routeName = '/repositories';

  static const _appBarTitle = 'GitHub Client';

  @override
  Widget build(BuildContext context) {
    final RepositoriesPageArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(RepositoriesPage._appBarTitle),
        ),
        body: Center(child: Text(args.userName)));
  }
}

