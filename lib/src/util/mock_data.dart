part of panacea;

AuthenticationTokenItem mockAuthenticationTokenItem() {
  return new AuthenticationTokenItem(jwt: 'test' );
}

UserProfileItem mockUserProfileItem() {
  return new UserProfileItem();
}

SignInResponseItem mockSignInResponseItem() {
  return new SignInResponseItem(
    profile: mockUserProfileItem(),
    token: mockAuthenticationTokenItem()
  );
}