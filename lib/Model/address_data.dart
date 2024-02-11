import 'package:copy_with_extension/copy_with_extension.dart';
part 'address_data.g.dart';

@CopyWith()
class Address {
  String street;
  String city;
  String zip;
  String country;
  String region;

  Address({
    required this.street,
    required this.city,
    required this.zip,
    required this.country,
    required this.region,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      zip: json['zip'],
      country: json['country'],
      region: json['region'],
    );
  }

  String get fullAddress => "$street, $zip $city, $country";
}
