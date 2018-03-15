part of panacea;

class SignInResponseItem {
  UserProfileItem profile;
  AuthenticationTokenItem token;

  SignInResponseItem({
    @required this.token,
    @required this.profile,
  })
    : assert(token != null),
      assert(profile != null);
}