// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthorizationDataCWProxy {
  AuthorizationData cookie(String cookie);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorizationData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorizationData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorizationData call({
    String? cookie,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthorizationData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthorizationData.copyWith.fieldName(...)`
class _$AuthorizationDataCWProxyImpl implements _$AuthorizationDataCWProxy {
  final AuthorizationData _value;

  const _$AuthorizationDataCWProxyImpl(this._value);

  @override
  AuthorizationData cookie(String cookie) => this(cookie: cookie);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorizationData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorizationData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorizationData call({
    Object? cookie = const $CopyWithPlaceholder(),
  }) {
    return AuthorizationData(
      cookie: cookie == const $CopyWithPlaceholder() || cookie == null
          ? _value.cookie
          // ignore: cast_nullable_to_non_nullable
          : cookie as String,
    );
  }
}

extension $AuthorizationDataCopyWith on AuthorizationData {
  /// Returns a callable class that can be used as follows: `instanceOfAuthorizationData.copyWith(...)` or like so:`instanceOfAuthorizationData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthorizationDataCWProxy get copyWith =>
      _$AuthorizationDataCWProxyImpl(this);
}
