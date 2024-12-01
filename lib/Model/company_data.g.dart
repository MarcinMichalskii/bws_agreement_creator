// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CompanyDataCWProxy {
  CompanyData name(String name);

  CompanyData address(String address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyData(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyData call({
    String? name,
    String? address,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCompanyData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCompanyData.copyWith.fieldName(...)`
class _$CompanyDataCWProxyImpl implements _$CompanyDataCWProxy {
  const _$CompanyDataCWProxyImpl(this._value);

  final CompanyData _value;

  @override
  CompanyData name(String name) => this(name: name);

  @override
  CompanyData address(String address) => this(address: address);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CompanyData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CompanyData(...).copyWith(id: 12, name: "My name")
  /// ````
  CompanyData call({
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return CompanyData(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
    );
  }
}

extension $CompanyDataCopyWith on CompanyData {
  /// Returns a callable class that can be used as follows: `instanceOfCompanyData.copyWith(...)` or like so:`instanceOfCompanyData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CompanyDataCWProxy get copyWith => _$CompanyDataCWProxyImpl(this);
}
