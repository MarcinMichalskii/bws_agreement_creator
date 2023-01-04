import 'package:copy_with_extension/copy_with_extension.dart';
part 'address_data.g.dart';

@CopyWith()
class AdressData {
  final String district;
  final String street;
  final String houseNumber;
  final String flatNumber;
  final String zipCode;
  final String city;
  final String country;
  final String citizenship;

  AdressData(
      {this.district = '',
      this.street = '',
      this.houseNumber = '',
      this.flatNumber = '',
      this.zipCode = '',
      this.city = '',
      this.country = '',
      this.citizenship = ''});

  bool get isEmpty {
    final allComponents = [
      district,
      street,
      houseNumber,
      flatNumber,
      zipCode,
      citizenship,
      country,
      citizenship
    ];

    for (String element in allComponents) {
      if (element.isNotEmpty) {
        return false;
      }
    }
    return true;
  }
}
