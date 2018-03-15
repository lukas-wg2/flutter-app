part of panacea;

Future<SignInResponseItem> signInWithGoogle() {
  return new Future(() {
    final response = mockSignInResponseItem();
    profile = response.profile;
    return response;
  });
}