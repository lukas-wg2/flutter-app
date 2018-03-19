part of panacea;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool consent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _performSubmit() {
      Navigator.of(context).pushReplacementNamed(MainPageRoute);
    }

    _performLogout() {
      signOutFlow().then((_) {
        Navigator.of(context).pushReplacementNamed(SignInPageRoute);
      });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Profile'),
        actions: <Widget>[
          new FlatButton(onPressed: _performLogout, child: new Text('Logout'))
        ],
      ),
      body: new Column(children: <Widget>[
        new Center(
          child: new Text('Incomplete profile')
        ),
        new Center(
            child: new Text('TODO: Add form fields')
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Consent to analytics stuff'),
            new Checkbox(value: consent, onChanged: (bool value) {
              setState(() {
                consent = value;
              });
            })
        ],),
        new Center(
          child: new RaisedButton(onPressed: _performSubmit, child: new Text('Submit'))
        )
      ],)
    );
  }
}