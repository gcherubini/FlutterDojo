import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/repositories_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const routeName = '/';

  static const _appBarTitle = 'GitHub Client';
  static const _enterUserNameText = 'Enter your GitHub username:';
  static const _contentHorizontalPixelSpacing = 50.0;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage._appBarTitle),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: HomePage._contentHorizontalPixelSpacing,
                vertical: 0.0
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(HomePage._enterUserNameText),
                TextField(
                  onChanged: (username) {
                    this._username = username;
                  },
                )
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRepositoriesPage,
        tooltip: 'Submit',
        child: Icon(Icons.navigate_next),
      ),
    );
  }

  void _navigateToRepositoriesPage() {
    Navigator.pushNamed(
        context,
        RepositoriesPage.routeName,
        arguments: RepositoriesPageArguments(_username)
    );
  }

}
