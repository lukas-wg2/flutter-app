part of panacea;

_buildFormSwitchElement(bool value, Function onChanged) => new Switch(
  value: value,
  onChanged: onChanged
);

createFloatingActionButton(BuildContext context) {
  return new FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        child: new DebugPage(state: GlobalState.debugState),
      );
    },
    child: new Icon(Icons.build));
}

class DebugPage extends StatefulWidget {

  DebugPage({ this.state }) : super();

  final state;

  @override
  State<StatefulWidget> createState() => new _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Form(
        child: new ListView(
          children: <Widget>[
            _buildFormSwitchElement(widget.state.getDevice, (bool val) => setState(() { widget.state.getDevice = val; })),
            _buildFormSwitchElement(widget.state.getProfile, (bool val) => setState(() { widget.state.getProfile = val; })),
            _buildFormSwitchElement(widget.state.signInWithGoogle, (bool val) => setState(() { widget.state.signInWithGoogle = val; })),
          ]
        )
      )
    );
  }

}

