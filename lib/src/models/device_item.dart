part of panacea;

class DeviceItem {
  String usage;

  DeviceItem({
    @required this.usage,
  })
    : assert(usage != null && usage.isNotEmpty);
}