import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/presenter/repository_detail_page.dart';

import 'model/repository_model.dart';

class RepositoriesPageArguments {
  final String userName;
  final List<RepositoryModel> repositories;

  RepositoriesPageArguments(this.userName, this.repositories);
}

class RepositoriesPage extends StatelessWidget {
  static const kRouteName = '/repositories';

  static const _appBarTitle = 'Repositories';
  static const _avatarUrl = 'https://avatars.githubusercontent.com/{userName}';
  static const _avatarImageSize = 120.0;

  List<RepositoryModel> _repositories;

  @override
  Widget build(BuildContext context) {
    final RepositoriesPageArguments args = ModalRoute.of(context).settings.arguments;
    _repositories = args.repositories;

    return Scaffold(
        appBar: AppBar(
          title: Text(RepositoriesPage._appBarTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ClipOval(
              child: Image.network(
                _avatarUrl.replaceFirst('{userName}', args.userName),
                width: _avatarImageSize,
                height: _avatarImageSize,
              ),
            ),
            SizedBox(height: 10),
            Text(args.userName),
            SizedBox(height: 10),
            Divider(),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ));
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: _repositories.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildListTile(context, _repositories[index]));
  }

  ListTile _buildListTile(BuildContext context, RepositoryModel repository) {
    return ListTile(
      title: Text(repository.title),
      onTap: () {
        _navigateToRepositoryDetailPage(context, repository);
      },
    );
  }

  void _navigateToRepositoryDetailPage(BuildContext context, RepositoryModel repository) {
    Navigator.pushNamed(context, RepositoryDetailPage.kRouteName,
        arguments: RepositoryDetailPageArguments(repository));
  }
}
