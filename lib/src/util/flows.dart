part of panacea;

Future<UserProfileItem> appStartFlow() async {
  final token = await Storage.getString(AUTH_TOKEN_STORAGE_KEY);
  if (token != null && token.isNotEmpty && isValidToken(token)) {
    GlobalState.token = new AuthenticationTokenItem(jwt: token);
    final profileId = await Storage.getString(PROFILE_ID_STORAGE_KEY);

    if (profileId != null && profileId.isNotEmpty) {
      final profile = await getProfile(profileId);
      profile.save();
      GlobalState.profile = profile;
      return profile;
    }
  }
  return null;
}

Future<void> signOutFlow() async {
  await Storage.removeAll();
}