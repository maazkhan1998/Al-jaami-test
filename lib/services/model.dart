class ApiGenericResponse {
  final bool status;
  final String message;
  final int statusCode;
  final dynamic data;

  ApiGenericResponse(
      {required this.status,
      required this.message,
      required this.statusCode,
      required this.data});
}

class Country {
  String? countryId;
  String? countryName;
  String? countryCode;
  String? phoneCode;
  String? isoCode3;
  String? status;
  String? image;

  Country(
      {this.countryId,
      this.countryName,
      this.countryCode,
      this.phoneCode,
      this.isoCode3,
      this.status,
      this.image});

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    phoneCode = json['phone_code'];
    isoCode3 = json['iso_code_3'];
    status = json['status'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_code'] = this.countryCode;
    data['phone_code'] = this.phoneCode;
    data['iso_code_3'] = this.isoCode3;
    data['status'] = this.status;
    data['image'] = this.image;
    return data;
  }
}
