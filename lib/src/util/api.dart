part of panacea;

Future<DeviceItem> getDevice(String id) {
  print('getDevice: ${GlobalState.debugState.getDevice}');
  if (GlobalState.debugState.getDevice == true) {
    return new Future(() => mockDeviceItem());
  } else {
    return new Future.error(null);
  }
}

Future<UserProfileItem> getProfile(String id) {
  print('getDevice: ${GlobalState.debugState.getProfile}');
  if (GlobalState.debugState.getProfile == true) {
    return new Future.delayed(new Duration(seconds: 3), () => mockUserProfileItem());
  } else {
    return new Future.error(null);
  }
}