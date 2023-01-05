// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_employee_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdditionalEmployeeDataCWProxy {
  AdditionalEmployeeData address(String address);

  AdditionalEmployeeData id(String id);

  AdditionalEmployeeData name(String name);

  AdditionalEmployeeData pesel(String pesel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdditionalEmployeeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdditionalEmployeeData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdditionalEmployeeData call({
    String? address,
    String? id,
    String? name,
    String? pesel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAdditionalEmployeeData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAdditionalEmployeeData.copyWith.fieldName(...)`
class _$AdditionalEmployeeDataCWProxyImpl
    implements _$AdditionalEmployeeDataCWProxy {
  final AdditionalEmployeeData _value;

  const _$AdditionalEmployeeDataCWProxyImpl(this._value);

  @override
  AdditionalEmployeeData address(String address) => this(address: address);

  @override
  AdditionalEmployeeData id(String id) => this(id: id);

  @override
  AdditionalEmployeeData name(String name) => this(name: name);

  @override
  AdditionalEmployeeData pesel(String pesel) => this(pesel: pesel);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdditionalEmployeeData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdditionalEmployeeData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdditionalEmployeeData call({
    Object? address = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? pesel = const $CopyWithPlaceholder(),
  }) {
    return AdditionalEmployeeData(
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      pesel: pesel == const $CopyWithPlaceholder() || pesel == null
          ? _value.pesel
          // ignore: cast_nullable_to_non_nullable
          : pesel as String,
    );
  }
}

extension $AdditionalEmployeeDataCopyWith on AdditionalEmployeeData {
  /// Returns a callable class that can be used as follows: `instanceOfAdditionalEmployeeData.copyWith(...)` or like so:`instanceOfAdditionalEmployeeData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdditionalEmployeeDataCWProxy get copyWith =>
      _$AdditionalEmployeeDataCWProxyImpl(this);
}
