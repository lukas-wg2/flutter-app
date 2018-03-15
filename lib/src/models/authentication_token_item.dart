part of panacea;

class AuthenticationTokenItem {
  String jwt;

  AuthenticationTokenItem({
    @required this.jwt
  })
    : assert(jwt != null && jwt.isNotEmpty);
}