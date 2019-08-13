import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepositoryDetailPage extends StatelessWidget {
  static const kRouteName = '/repositoryDetail';
  static const _appBarTitle = 'Repository detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Repository detail')
          ],
        ),
      ),
    );
  }
}
