class CatApiResponse {
  CatApiResponse({
    required this.ownerName,
    required this.address,
    required this.registrationNumber,
    required this.fatherName,
    required this.engineNumber,
    required this.chassisNumber,
    required this.seatingCapacity,
    required this.isFinanced,
    required this.fitnessUpTo,
    required this.manufacturerModel,
    required this.colour,
    required this.registrationDate,
    required this.registeredPlace,
    required this.insurancePolicyNo,
    required this.fuelType,
    required this.insuranceName,
    required this.insuranceValidity,
    required this.financier,
    required this.manufacturer,
  });

  CatApiResponse.sec();

  late String ownerName;
  late String address;
  late String registrationNumber;
  late String fatherName;
  late String engineNumber;
  late String chassisNumber;
  late String seatingCapacity;
  late bool isFinanced;
  late String fitnessUpTo;
  late String manufacturerModel;
  late String colour;
  late String registrationDate;
  late String registeredPlace;
  late String insurancePolicyNo;
  late String fuelType;
  late String insuranceName;
  late String insuranceValidity;
  late String financier;
  late String manufacturer;
}
