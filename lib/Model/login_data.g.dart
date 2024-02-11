// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginDataCWProxy {
  LoginData address(String? address);

  LoginData birthDate(String birthDate);

  LoginData cookie(String cookie);

  LoginData idNumber(String? idNumber);

  LoginData name(String name);

  LoginData passportId(String? passportId);

  LoginData pesel(String? pesel);

  LoginData phone(String phone);

  LoginData studentId(String? studentId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginData(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginData call({
    String? address,
    String? birthDate,
    String? cookie,
    String? idNumber,
    String? name,
    String? passportId,
    String? pesel,
    String? phone,
    String? studentId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginData.copyWith.fieldName(...)`
class _$LoginDataCWProxyImpl implements _$LoginDataCWProxy {
  final LoginData _value;

  const _$LoginDataCWProxyImpl(this._value);

  @override
  LoginData address(String? address) => this(address: address);

  @override
  LoginData birthDate(String birthDate) => this(birthDate: birthDate);

  @override
  LoginData cookie(String cookie) => this(cookie: cookie);

  @override
  LoginData idNumber(String? idNumber) => this(idNumber: idNumber);

  @override
  LoginData name(String name) => this(name: name);

  @override
  LoginData passportId(String? passportId) => this(passportId: passportId);

  @override
  LoginData pesel(String? pesel) => this(pesel: pesel);

  @override
  LoginData phone(String phone) => this(phone: phone);

  @override
  LoginData studentId(String? studentId) => this(studentId: studentId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginData(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginData call({
    Object? address = const $CopyWithPlaceholder(),
    Object? birthDate = const $CopyWithPlaceholder(),
    Object? cookie = const $CopyWithPlaceholder(),
    Object? idNumber = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? passportId = const $CopyWithPlaceholder(),
    Object? pesel = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? studentId = const $CopyWithPlaceholder(),
  }) {
    return LoginData(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      birthDate: birthDate == const $CopyWithPlaceholder() || birthDate == null
          ? _value.birthDate
          // ignore: cast_nullable_to_non_nullable
          : birthDate as String,
      cookie: cookie == const $CopyWithPlaceholder() || cookie == null
          ? _value.cookie
          // ignore: cast_nullable_to_non_nullable
          : cookie as String,
      idNumber: idNumber == const $CopyWithPlaceholder()
          ? _value.idNumber
          // ignore: cast_nullable_to_non_nullable
          : idNumber as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      passportId: passportId == const $CopyWithPlaceholder()
          ? _value.passportId
          // ignore: cast_nullable_to_non_nullable
          : passportId as String?,
      pesel: pesel == const $CopyWithPlaceholder()
          ? _value.pesel
          // ignore: cast_nullable_to_non_nullable
          : pesel as String?,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String,
      studentId: studentId == const $CopyWithPlaceholder()
          ? _value.studentId
          // ignore: cast_nullable_to_non_nullable
          : studentId as String?,
    );
  }
}

extension $LoginDataCopyWith on LoginData {
  /// Returns a callable class that can be used as follows: `instanceOfLoginData.copyWith(...)` or like so:`instanceOfLoginData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginDataCWProxy get copyWith => _$LoginDataCWProxyImpl(this);
}
