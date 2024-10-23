class CarDetails {
  CarDetails({
    String? make,
    String? model,
    String? registrationPlate,
    num? year,}){
    _make = make;
    _model = model;
    _registrationPlate = registrationPlate;
    _year = year;
  }

  CarDetails.fromJson(dynamic json) {
    _make = json['make'];
    _model = json['model'];
    _registrationPlate = json['registrationPlate'];
    _year = json['year'];
  }
  String? _make;
  String? _model;
  String? _registrationPlate;
  num? _year;
  CarDetails copyWith({  String? make,
    String? model,
    String? registrationPlate,
    num? year,
  }) => CarDetails(  make: make ?? _make,
    model: model ?? _model,
    registrationPlate: registrationPlate ?? _registrationPlate,
    year: year ?? _year,
  );
  String? get make => _make;
  String? get model => _model;
  String? get registrationPlate => _registrationPlate;
  num? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['make'] = _make;
    map['model'] = _model;
    map['registrationPlate'] = _registrationPlate;
    map['year'] = _year;
    return map;
  }

}