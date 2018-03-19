part of panacea;

class DevicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  DeviceItem _device;
  final TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = '50';
    _refresh();
  }

  _refresh() {
    getDevice('123').then((DeviceItem device) {
      setState(() {
        _device = device;
      });
    });
  }

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();
    new Timer(const Duration(seconds: 3), () {
      _refresh();
      completer.complete(null);
    });
    return completer.future.then((_) {
      _scaffoldKey.currentState?.showSnackBar(new SnackBar(
          content: const Text('Refresh complete'),
          action: new SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }
          )
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Usage'),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.power_settings_new),
                tooltip: 'Logout',
                onPressed: () {
                  signOutFlow().then((_) {
                    Navigator.of(context).pushReplacementNamed(SignInPageRoute);
                  });
                },
            ),
            new IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsPageRoute);
              }
            )
          ]
      ),
      body: new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: new SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: new Column(children: <Widget>[
            new Center(child: new Container(child: new Text('Usage', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 100.0),))),
            new Center(child: new Text(_device != null ? _device.usage : '')),
            new TextField(
                decoration: new InputDecoration(labelText: 'Top up by'),
                controller: controller
            ),
            new Center(
              child: new RaisedButton(onPressed: () {
                // TODO: Add topup API
              }, child: new Text('Buy')),
            )
          ],)
        )
      )
    );
  }
}