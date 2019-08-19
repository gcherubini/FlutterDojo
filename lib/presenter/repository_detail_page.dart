import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/repository_model.dart';

class RepositoryDetailPageArguments {
  final RepositoryModel repositoryModel;

  RepositoryDetailPageArguments(this.repositoryModel);
}

class RepositoryDetailPage extends StatelessWidget {
  static const kRouteName = '/repositoryDetail';
  static const _repositoryDescriptionTextSize = 22.0;
  static const _unknownRepositoryDescriptionMessage = 'Unknown repository description';

  @override
  Widget build(BuildContext context) {
    final RepositoryDetailPageArguments args = ModalRoute.of(context).settings.arguments;
    final repositoryModel = args.repositoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(repositoryModel.title),
      ),
      body: Center(
        child: Text(
              repositoryModel.description ?? _unknownRepositoryDescriptionMessage,
              style: TextStyle(
                  fontSize: _repositoryDescriptionTextSize
              )
        ),
      ),
    );
  }
}
