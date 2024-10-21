class CustomerDetails {
  final String name;
  final String phoneNumber;
  final String email;

  CustomerDetails({
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
