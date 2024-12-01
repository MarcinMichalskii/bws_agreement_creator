// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthorizationDataCWProxy {
  AuthorizationData accessToken(String accessToken);

  AuthorizationData refreshToken(String refreshToken);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorizationData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorizationData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorizationData call({
    String? accessToken,
    String? refreshToken,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthorizationData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthorizationData.copyWith.fieldName(...)`
class _$AuthorizationDataCWProxyImpl implements _$AuthorizationDataCWProxy {
  const _$AuthorizationDataCWProxyImpl(this._value);

  final AuthorizationData _value;

  @override
  AuthorizationData accessToken(String accessToken) =>
      this(accessToken: accessToken);

  @override
  AuthorizationData refreshToken(String refreshToken) =>
      this(refreshToken: refreshToken);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorizationData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorizationData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorizationData call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
  }) {
    return AuthorizationData(
      accessToken:
          accessToken == const $CopyWithPlaceholder() || accessToken == null
              ? _value.accessToken
              // ignore: cast_nullable_to_non_nullable
              : accessToken as String,
      refreshToken:
          refreshToken == const $CopyWithPlaceholder() || refreshToken == null
              ? _value.refreshToken
              // ignore: cast_nullable_to_non_nullable
              : refreshToken as String,
    );
  }
}

extension $AuthorizationDataCopyWith on AuthorizationData {
  /// Returns a callable class that can be used as follows: `instanceOfAuthorizationData.copyWith(...)` or like so:`instanceOfAuthorizationData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthorizationDataCWProxy get copyWith =>
      _$AuthorizationDataCWProxyImpl(this);
}
