enum VehType {
  bike,
  car,
}

enum ServiceType {
  fullService,
  washing,
  partService,
  emergencyService,
}

class VehicleService {
  static final VehicleService _singleton = VehicleService._internal();
  String ownerName;
  String vehicleName;
  String vehicleRegNum;
  String series;
  String engNum;
  VehType vehicleType;
  ServiceType serviceType;

  factory VehicleService() {
    return _singleton;
  }

  VehicleService._internal();
}
