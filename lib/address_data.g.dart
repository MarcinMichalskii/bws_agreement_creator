// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AdressDataCWProxy {
  AdressData citizenship(String citizenship);

  AdressData city(String city);

  AdressData country(String country);

  AdressData flatNumber(String flatNumber);

  AdressData houseNumber(String houseNumber);

  AdressData street(String street);

  AdressData zipCode(String zipCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdressData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdressData call({
    String? citizenship,
    String? city,
    String? country,
    String? flatNumber,
    String? houseNumber,
    String? street,
    String? zipCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAdressData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAdressData.copyWith.fieldName(...)`
class _$AdressDataCWProxyImpl implements _$AdressDataCWProxy {
  final AdressData _value;

  const _$AdressDataCWProxyImpl(this._value);

  @override
  AdressData citizenship(String citizenship) => this(citizenship: citizenship);

  @override
  AdressData city(String city) => this(city: city);

  @override
  AdressData country(String country) => this(country: country);

  @override
  AdressData flatNumber(String flatNumber) => this(flatNumber: flatNumber);

  @override
  AdressData houseNumber(String houseNumber) => this(houseNumber: houseNumber);

  @override
  AdressData street(String street) => this(street: street);

  @override
  AdressData zipCode(String zipCode) => this(zipCode: zipCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AdressData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AdressData(...).copyWith(id: 12, name: "My name")
  /// ````
  AdressData call({
    Object? citizenship = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? flatNumber = const $CopyWithPlaceholder(),
    Object? houseNumber = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? zipCode = const $CopyWithPlaceholder(),
  }) {
    return AdressData(
      citizenship:
          citizenship == const $CopyWithPlaceholder() || citizenship == null
              ? _value.citizenship
              // ignore: cast_nullable_to_non_nullable
              : citizenship as String,
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      flatNumber:
          flatNumber == const $CopyWithPlaceholder() || flatNumber == null
              ? _value.flatNumber
              // ignore: cast_nullable_to_non_nullable
              : flatNumber as String,
      houseNumber:
          houseNumber == const $CopyWithPlaceholder() || houseNumber == null
              ? _value.houseNumber
              // ignore: cast_nullable_to_non_nullable
              : houseNumber as String,
      street: street == const $CopyWithPlaceholder() || street == null
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String,
      zipCode: zipCode == const $CopyWithPlaceholder() || zipCode == null
          ? _value.zipCode
          // ignore: cast_nullable_to_non_nullable
          : zipCode as String,
    );
  }
}

extension $AdressDataCopyWith on AdressData {
  /// Returns a callable class that can be used as follows: `instanceOfAdressData.copyWith(...)` or like so:`instanceOfAdressData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AdressDataCWProxy get copyWith => _$AdressDataCWProxyImpl(this);
}
