part of panacea;

class GlobalState {
  static AuthenticationTokenItem token;
  static UserProfileItem profile;
  static DebugStateItem debugState = new DebugStateItem(getDevice: true, getProfile: true, signInWithGoogle: true);
}

UserProfileItem profile;