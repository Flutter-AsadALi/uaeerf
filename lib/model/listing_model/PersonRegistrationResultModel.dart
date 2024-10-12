class PersonRegistrationResponse {
  final bool isRegistrationSuccessful;
  final List<String> messages;

  PersonRegistrationResponse({
    required this.isRegistrationSuccessful,
    required this.messages,
  });

  // Factory constructor to create from a map
  factory PersonRegistrationResponse.fromMap(Map<String, dynamic> map) {
    return PersonRegistrationResponse(
      isRegistrationSuccessful: map['Submit_PersonNewRegistrationResult'] as bool,
      messages: List<String>.from(map['msg']),
    );
  }

  // Convert to map (optional, if needed)
  Map<String, dynamic> toMap() {
    return {
      'Submit_PersonNewRegistrationResult': isRegistrationSuccessful,
      'msg': messages,
    };
  }

  @override
  String toString() {
    return 'PersonRegistrationResponse(isRegistrationSuccessful: $isRegistrationSuccessful, messages: $messages)';
  }
}
