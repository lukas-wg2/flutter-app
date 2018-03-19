part of panacea;

Future<SignInResponseItem> signInWithGoogle() {
  return new Future(() {
    final response = mockSignInResponseItem();
    return response;
  });
}

isValidToken(String auth_token) {
  return true;
}