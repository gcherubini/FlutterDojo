import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepositoriesPageArguments {
  final String userName;

  RepositoriesPageArguments(this.userName);
}

class RepositoriesPage extends StatelessWidget {
  static const kRouteName = '/repositories';

  static const _appBarTitle = 'Repositories';
  static const _avatarUrl = 'https://avatars.githubusercontent.com/{userName}';
  static const _avatarImageSize = 120.0;

  @override
  Widget build(BuildContext context) {
    final RepositoriesPageArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(RepositoriesPage._appBarTitle),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.network(
                _avatarUrl.replaceFirst('{userName}', args.userName),
                width: _avatarImageSize,
                height: _avatarImageSize,
              ),
            ),
            SizedBox(height: 10),
            Text(args.userName),
          ],
        )));
  }
}
