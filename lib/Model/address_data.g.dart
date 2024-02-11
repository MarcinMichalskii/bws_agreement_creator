// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address city(String city);

  Address country(String country);

  Address region(String region);

  Address street(String street);

  Address zip(String zip);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    String? city,
    String? country,
    String? region,
    String? street,
    String? zip,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  final Address _value;

  const _$AddressCWProxyImpl(this._value);

  @override
  Address city(String city) => this(city: city);

  @override
  Address country(String country) => this(country: country);

  @override
  Address region(String region) => this(region: region);

  @override
  Address street(String street) => this(street: street);

  @override
  Address zip(String zip) => this(zip: zip);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    Object? city = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? region = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? zip = const $CopyWithPlaceholder(),
  }) {
    return Address(
      city: city == const $CopyWithPlaceholder() || city == null
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String,
      country: country == const $CopyWithPlaceholder() || country == null
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String,
      region: region == const $CopyWithPlaceholder() || region == null
          ? _value.region
          // ignore: cast_nullable_to_non_nullable
          : region as String,
      street: street == const $CopyWithPlaceholder() || street == null
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String,
      zip: zip == const $CopyWithPlaceholder() || zip == null
          ? _value.zip
          // ignore: cast_nullable_to_non_nullable
          : zip as String,
    );
  }
}

extension $AddressCopyWith on Address {
  /// Returns a callable class that can be used as follows: `instanceOfAddress.copyWith(...)` or like so:`instanceOfAddress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressCWProxy get copyWith => _$AddressCWProxyImpl(this);
}
