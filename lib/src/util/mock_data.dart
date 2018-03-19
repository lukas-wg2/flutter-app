part of panacea;

var uuid = new Uuid();

AuthenticationTokenItem mockAuthenticationTokenItem() {
  return new AuthenticationTokenItem(jwt: 'test' );
}

UserProfileItem mockUserProfileItem() {
  return new UserProfileItem(id: uuid.v4(), devices: []);
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