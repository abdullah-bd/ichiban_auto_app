class CarDetails {
  final String make;
  final String model;
  final int year;
  final String registrationPlate;

  CarDetails({
    required this.make,
    required this.model,
    required this.year,
    required this.registrationPlate,
  });

  Map<String, dynamic> toJson() {
    return {
      'make': make,
      'model': model,
      'year': year,
      'registrationPlate': registrationPlate,
    };
  }
}