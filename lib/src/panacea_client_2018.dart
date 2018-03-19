library panacea;

import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'pages/pages.dart';
part 'pages/sign_in_page.dart';
part 'pages/profile_page.dart';
part 'pages/device_page.dart';
part 'pages/settings_page.dart';

part 'util/authentication.dart';
part 'util/mock_data.dart';
part 'util/api.dart';
part 'util/state.dart';
part 'util/storage.dart';
part 'util/constants.dart';
part 'util/flows.dart';

part 'models/authentication_token_item.dart';
part 'models/sign_in_response_item.dart';
part 'models/user_profile_item.dart';
part 'models/device_item.dart';
part 'models/debug_state_item.dart';

part 'widgets/debug_floating_action_button.dart';

class PanaceaClient2018 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<UserProfileItem>(
      future: appStartFlow(),
      builder: (BuildContext context, AsyncSnapshot<UserProfileItem> snapshot) {
        print('Connection state: ${snapshot.connectionState}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Center(child: new Directionality(textDirection: TextDirection.ltr, child: new Text('Loading...')));
          default:
            if (snapshot.hasError) {
              return new Center(child: new Directionality(textDirection: TextDirection.ltr, child: new Text('Error: ${snapshot.error}')));
            } else {
              return new MaterialApp(
                  title: 'Panacea',
                  debugShowCheckedModeBanner: false,
                  theme: new ThemeData(
                      fontFamily: 'Helvetica Neue',
                      primarySwatch: Colors.red,
                      buttonColor: Colors.orangeAccent
                  ),
                  home: _getHomePage(snapshot.data),
                  routes: <String, WidgetBuilder>{
                    MainPageRoute: (BuildContext context) => new DevicePage(),
                    ProfilePageRoute: (BuildContext context) => new ProfilePage(),
                    SettingsPageRoute: (BuildContext context) => new SettingsPage(),
                    SignInPageRoute: (BuildContext context) => new SignInPage(),
                  }
              );
            }
        }
      }
    );
  }

  Widget _getHomePage(UserProfileItem profile) {
    if (profile == null) {
      return new SignInPage();
    } else if (!profile.isValid()) {
      return new ProfilePage();
    } else {
      return new DevicePage();
    }
  }
}