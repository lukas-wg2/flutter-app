part of panacea;

class UserProfileItem {

  final String id;
  List<String> devices;

  UserProfileItem({
    @required this.id,
    @required this.devices
  })
    : assert(id != null && id.isNotEmpty),
      assert(devices != null);

  bool isValid() {
    return false;
  }

  Future<void> save() async {
    Storage.setString(PROFILE_ID_STORAGE_KEY, this.id);
  }
}