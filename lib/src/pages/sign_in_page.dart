part of panacea;

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    _performLogin() {
      signInWithGoogle().then((SignInResponseItem response) {
        GlobalState.token = response.token;
        GlobalState.token.save();
        GlobalState.profile = response.profile;
        GlobalState.profile.save();
        if (response.profile.isValid()) {
          Navigator.of(context).pushReplacementNamed(MainPageRoute);
        } else {
          Navigator.of(context).pushReplacementNamed(ProfilePageRoute);
        }
      }).catchError((_) => print('ERROR HAPPENED'));
    }

    return new Scaffold(
        floatingActionButton: createFloatingActionButton(context),
        appBar: new AppBar(
          title: new Text('Sign In')
        ),
      body: new Column(
        children: <Widget>[
          new Expanded(child: new Center(child: new RaisedButton(onPressed: _performLogin, child: new Text('Login with google'),))),
        ],
      )
    );
  }
}