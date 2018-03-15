part of panacea;

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    _performLogin() {
      signInWithGoogle().then((response) {
        // TODO: Store user profile and token locally
        print(response.profile);
        if (response.profile.isValid()) {
          Navigator.of(context).pushReplacementNamed(MainPageRoute);
        } else {
          Navigator.of(context).pushReplacementNamed(ProfilePageRoute);
        }
      });
    }

    return new Scaffold(
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