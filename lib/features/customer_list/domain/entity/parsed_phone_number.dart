class ParsedPhoneNumber {

  int? country_code;
  String? e164;
  String? national;
  String? type;
  String? international;
  String? national_number;


  ParsedPhoneNumber({
    required this.country_code,
    required this.e164,
    required this.national,
    required this.type,
    required this.international,
    required this.national_number,});



  ParsedPhoneNumber.fromJson(dynamic json) {
    country_code = json['country_code'];
    e164 = json['e164'];
    national = json['national'];
    type = json['type'];
    international = json['international'];
    national_number = json['national_number'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_code'] = country_code;
    map['e164'] = e164;
    map['national'] = national;
    map['type'] = type;
    map['international'] = international;
    map['national_number'] = national_number;
    return map;
  }

}