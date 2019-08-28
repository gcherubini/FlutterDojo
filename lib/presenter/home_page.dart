import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/presenter/repositories_page.dart';
import 'package:http/http.dart';

import 'model/repository_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const _appBarTitle = 'GitHub Client';
  static const _enterUserNameText = 'Enter your GitHub username:';
  static const _userNotFoundAlertTitle = 'Error';
  static const _userNotFoundAlertMessage = 'Sorry, user not found!';
  static const _userGenericAlertMessage = 'Ops.. Something went wrong.\nPlease try again later';
  static const _userNotFoundAlertOkButton = 'OK';
  static const _getRepositoriesUrl = 'https://api.github.com/users/{userName}/repos';
  static const _contentHorizontalPixelSpacing = 50.0;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage._appBarTitle),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: HomePage._contentHorizontalPixelSpacing, vertical: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(HomePage._enterUserNameText),
            TextField(
              onChanged: (username) {
                this._username = username;
                setState(() {
                  _isButtonEnabled = username.isNotEmpty;
                });
              },
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _isButtonEnabled ? _getUserRepositories : null,
        disabledElevation: 0.0,
        backgroundColor: _isButtonEnabled ? Colors.blue : Colors.grey,
        tooltip: 'Submit',
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  void _getUserRepositories() {
    get(HomePage._getRepositoriesUrl.replaceFirst('{userName}', _username))
        .then((response) {
      switch (response.statusCode) {
        case HttpStatus.ok:
          _handleGetRepositoriesSuccessResponse(response);
          break;
        case HttpStatus.notFound:
          _showErrorAlert(HomePage._userNotFoundAlertMessage);
          break;
        default:
          _showErrorAlert(HomePage._userGenericAlertMessage);
      }
    }).catchError((error) {
      _showErrorAlert(HomePage._userGenericAlertMessage);
    });
  }

  void _handleGetRepositoriesSuccessResponse(Response response) {
    Iterable list = json.decode(response.body);
    var repositories =
        list.map((dynamic model) => RepositoryModel.fromJson(model)).toList();
    _navigateToRepositoriesPage(repositories);
  }

  Future<void> _showErrorAlert(String errorMessage) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(HomePage._userNotFoundAlertTitle),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              child: Text(HomePage._userNotFoundAlertOkButton),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToRepositoriesPage(List<RepositoryModel> repositories) {
    Navigator.pushNamed(context, RepositoriesPage.kRouteName,
        arguments: RepositoriesPageArguments(_username, repositories));
  }
}
