library panacea;

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

part 'pages/pages.dart';
part 'pages/sign_in_page.dart';
part 'pages/profile_page.dart';
part 'pages/device_page.dart';
part 'pages/settings_page.dart';

part 'util/authentication.dart';
part 'util/mock_data.dart';
part 'util/api.dart';
part 'util/state.dart';

part 'models/authentication_token_item.dart';
part 'models/sign_in_response_item.dart';
part 'models/user_profile_item.dart';
part 'models/device_item.dart';

class PanaceaClient2018 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Panacea',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Helvetica Neue',
        primarySwatch: Colors.red,
        buttonColor: Colors.orangeAccent
      ),
      home: new SignInPage(),
      routes: <String, WidgetBuilder>{
        MainPageRoute: (BuildContext context) => new DevicePage(),
        ProfilePageRoute: (BuildContext context) => new ProfilePage(),
        SettingsPageRoute: (BuildContext context) => new SettingsPage(),
      }
    );
  }
}