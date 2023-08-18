class VehicleDetailsResponse {
  late String _ownerName;
  late String _address;

  String get ownerName => _ownerName;

  set ownerName(String value) {
    _ownerName = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }
}
