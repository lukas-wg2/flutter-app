part of panacea;

class Storage {
  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<bool> hasString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String value = prefs.getString(key);
    return value != null && value.isNotEmpty;
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> removeAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AUTH_TOKEN_STORAGE_KEY);
    prefs.remove(PROFILE_ID_STORAGE_KEY);
  }
}