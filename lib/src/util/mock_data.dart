part of panacea;

AuthenticationTokenItem mockAuthenticationTokenItem() {
  return new AuthenticationTokenItem(jwt: 'test' );
}

UserProfileItem mockUserProfileItem() {
  return new UserProfileItem(devices: []);
}

SignInResponseItem mockSignInResponseItem() {
  return new SignInResponseItem(
    profile: mockUserProfileItem(),
    token: mockAuthenticationTokenItem()
  );
}

DeviceItem mockDeviceItem() {
  return new DeviceItem(usage: (new Random().nextDouble() * 100).toString());
}