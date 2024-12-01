import 'package:copy_with_extension/copy_with_extension.dart';

part 'company_data.g.dart';

@CopyWith()
class CompanyData {
  final String name;
  final String address;

  CompanyData({required this.name, required this.address});

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      name: json['name'],
      address: json['address'],
    );
  }
}
