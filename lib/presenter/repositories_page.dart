import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/presenter/repository_detail_page.dart';

import 'model/repository_model.dart';

class RepositoriesPageArguments {
  final String userName;

  RepositoriesPageArguments(this.userName);
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

    _setupRepositories();

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
            Expanded(
              child: _buildListView(),
            ),
          ],
        ));
  }

  void _setupRepositories() {
    _repositories = List();
    _repositories.add(RepositoryModel(
        'Repository 1',
        'Repository description 1'));
    _repositories.add(RepositoryModel(
        'Repository 2',
        null));
    _repositories.add(RepositoryModel(
        'Repository 3',
        'Repository description 3'));
    _repositories.add(RepositoryModel(
        'Repository 4',
        'Repository description 4'));
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
