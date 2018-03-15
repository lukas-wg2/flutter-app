part of panacea;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool consent = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext widget) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Settings')
      ),
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Consent to analytics stuff'),
          new Checkbox(value: consent, onChanged: (bool value) {
            setState(() {
              consent = value;
            });
          })
        ],),
    );
  }
}