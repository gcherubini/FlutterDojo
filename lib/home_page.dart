import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/repositories_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const _appBarTitle = 'GitHub Client';
  static const _enterUserNameText = 'Enter your GitHub username:';
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
        onPressed: _isButtonEnabled ? _navigateToRepositoriesPage : null,
        disabledElevation: 0.0,
        backgroundColor: _isButtonEnabled ? Colors.blue : Colors.grey,
        tooltip: 'Submit',
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  void _navigateToRepositoriesPage() {
    Navigator.pushNamed(context, RepositoriesPage.kRouteName);
  }
}
