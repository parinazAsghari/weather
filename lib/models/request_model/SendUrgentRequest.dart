class SendUrgentRequest {
  SendUrgentRequest({
    String? mobile,
    String? firstName,
    String? lastName,
    String? nationalCode,
  }) {
    _mobile = mobile;
    _firstName = firstName;
    _lastName = lastName;
    _nationalCode = nationalCode;
  }

  SendUrgentRequest.fromJson(dynamic json) {
    _mobile = json['Mobile'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _nationalCode = json['NationalCode'];
  }

  String? _mobile;
  String? _firstName;
  String? _lastName;
  String? _nationalCode;

  String? get mobile => _mobile;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get nationalCode => _nationalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Mobile'] = _mobile;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['NationalCode'] = _nationalCode;
    return map;
  }
}
