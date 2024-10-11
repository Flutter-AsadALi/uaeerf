class PersonRegistrationResult {
  final bool isRegistrationSuccessful;

  PersonRegistrationResult({required this.isRegistrationSuccessful});

  // Factory constructor to create from a map
  factory PersonRegistrationResult.fromMap(Map<String, dynamic> map) {
    return PersonRegistrationResult(
      isRegistrationSuccessful: map['Submit_PersonNewRegistrationResult'] as bool,
    );
  }

  // Convert to map (optional, if needed)
  Map<String, dynamic> toMap() {
    return {
      'Submit_PersonNewRegistrationResult': isRegistrationSuccessful,
    };
  }

  @override
  String toString() {
    return 'PersonRegistrationResult(isRegistrationSuccessful: $isRegistrationSuccessful)';
  }
}
