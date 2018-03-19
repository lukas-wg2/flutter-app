part of panacea;

Future<DeviceItem> getDevice(String id) {
  return new Future(() => mockDeviceItem());
}

Future<UserProfileItem> getProfile(String id) {
  return new Future.delayed(new Duration(seconds: 3), () => mockUserProfileItem());
}