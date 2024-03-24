// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginDataCWProxy {
  ProfileData address(String? address);

  ProfileData birthDate(String birthDate);

  ProfileData email(String email);

  ProfileData hasStudentIdPhoto(bool hasStudentIdPhoto);

  ProfileData idNumber(String? idNumber);

  ProfileData name(String name);

  ProfileData passportId(String? passportId);

  ProfileData pesel(String? pesel);

  ProfileData phone(String phone);

  ProfileData studentId(String? studentId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginData(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileData call({
    String? address,
    String? birthDate,
    String? email,
    bool? hasStudentIdPhoto,
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
  final ProfileData _value;

  const _$LoginDataCWProxyImpl(this._value);

  @override
  ProfileData address(String? address) => this(address: address);

  @override
  ProfileData birthDate(String birthDate) => this(birthDate: birthDate);

  @override
  ProfileData email(String email) => this(email: email);

  @override
  ProfileData hasStudentIdPhoto(bool hasStudentIdPhoto) =>
      this(hasStudentIdPhoto: hasStudentIdPhoto);

  @override
  ProfileData idNumber(String? idNumber) => this(idNumber: idNumber);

  @override
  ProfileData name(String name) => this(name: name);

  @override
  ProfileData passportId(String? passportId) => this(passportId: passportId);

  @override
  ProfileData pesel(String? pesel) => this(pesel: pesel);

  @override
  ProfileData phone(String phone) => this(phone: phone);

  @override
  ProfileData studentId(String? studentId) => this(studentId: studentId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginData(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileData call({
    Object? address = const $CopyWithPlaceholder(),
    Object? birthDate = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? hasStudentIdPhoto = const $CopyWithPlaceholder(),
    Object? idNumber = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? passportId = const $CopyWithPlaceholder(),
    Object? pesel = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? studentId = const $CopyWithPlaceholder(),
  }) {
    return ProfileData(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      birthDate: birthDate == const $CopyWithPlaceholder() || birthDate == null
          ? _value.birthDate
          // ignore: cast_nullable_to_non_nullable
          : birthDate as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      hasStudentIdPhoto: hasStudentIdPhoto == const $CopyWithPlaceholder() ||
              hasStudentIdPhoto == null
          ? _value.hasStudentIdPhoto
          // ignore: cast_nullable_to_non_nullable
          : hasStudentIdPhoto as bool,
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

extension $LoginDataCopyWith on ProfileData {
  /// Returns a callable class that can be used as follows: `instanceOfLoginData.copyWith(...)` or like so:`instanceOfLoginData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginDataCWProxy get copyWith => _$LoginDataCWProxyImpl(this);
}
