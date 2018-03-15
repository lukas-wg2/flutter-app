part of panacea;

class UserProfileItem {

  List<String> devices;

  UserProfileItem({
    @required this.devices
  })
    : assert(devices != null);

  bool isValid() {
    return false;
  }
}