part of panacea;

Future<SignInResponseItem> signInWithGoogle() {
  if (GlobalState.debugState.signInWithGoogle == true) {
    return new Future(() {
      final response = mockSignInResponseItem();
      return response;
    });
  } else {
    return new Future.error(null);
  }
}

isValidToken(String auth_token) {
  return true;
}