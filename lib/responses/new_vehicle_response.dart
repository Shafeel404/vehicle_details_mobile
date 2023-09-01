class NewVehicleDetailsResponse {
  NewVehicleDetailsResponse({
    required this.vehicleId,
    required this.ownerName,
    required this.licensePlate,
    required this.fatherName,
    required this.address,
    required this.engineNumber,
    required this.chassisNumber,
    required this.seatingCapacity,
    required this.isFinanced,
    required this.manufacturerModel,
    required this.colour,
    required this.insurancePolicyNo,
    required this.fuelType,
    required this.insuranceName,
    required this.insuranceValidity,
    required this.financier,
    required this.manufacturer,
  });

  NewVehicleDetailsResponse.sec();

  late String vehicleId;
  late String ownerName;
  late String address;
  late String licensePlate;
  late String fatherName;
  late String engineNumber;
  late String chassisNumber;
  late String seatingCapacity;
  late bool isFinanced;
  late String manufacturerModel;
  late String colour;
  late String insurancePolicyNo;
  late String fuelType;
  late String insuranceName;
  late String insuranceValidity;
  late String financier;
  late String manufacturer;
}
