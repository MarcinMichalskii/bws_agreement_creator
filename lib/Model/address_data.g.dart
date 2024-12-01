// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address street(String street);

  Address city(String city);

  Address zip(String zip);

  Address country(String country);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    String? street,
    String? city,
    String? zip,
    String? country,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  const _$AddressCWProxyImpl(this._value);

  final Address _value;

  @override
  Address street(String street) => this(street: street);

  @override
  Address city(String city) => this(city: city);

  @override
  Address zip(String zip) => this(zip: zip);

  @override
  Address country(String country) => this(country: country);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    Object? street = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? zip = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
  }) {
    return Address(
      street: street == const $CopyWithPlaceholder() || street == null
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String,
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      zip: zip == const $CopyWithPlaceholder() || zip == null
          ? _value.zip
          // ignore: cast_nullable_to_non_nullable
          : zip as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
    );
  }
}

extension $AddressCopyWith on Address {
  /// Returns a callable class that can be used as follows: `instanceOfAddress.copyWith(...)` or like so:`instanceOfAddress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressCWProxy get copyWith => _$AddressCWProxyImpl(this);
}
