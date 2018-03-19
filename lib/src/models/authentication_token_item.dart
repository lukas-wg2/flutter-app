part of panacea;

class AuthenticationTokenItem {
  String jwt;

  AuthenticationTokenItem({
    @required this.jwt
  })
    : assert(jwt != null && jwt.isNotEmpty);

  save() {
    Storage.setString(AUTH_TOKEN_STORAGE_KEY, this.jwt);
  }
}