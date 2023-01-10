import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
part 'additional_employee_data.g.dart';

@CopyWith()
class AdditionalEmployeeData {
  final String id;
  final String name;
  final String address;
  final String pesel;

  AdditionalEmployeeData(
      {required this.id,
      required this.name,
      required this.address,
      required this.pesel});

  bool get isAnyValueEmpty {
    return [
      name,
      address,
      pesel,
    ].contains('');
  }

  bool get isEmpty {
    final allComponents = [
      name,
      address,
      pesel,
    ];

    for (String element in allComponents) {
      if (element.isNotEmpty) {
        return false;
      }
    }
    return true;
  }
}
