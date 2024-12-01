// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppStateCWProxy {
  AppState isLoggedIn(bool isLoggedIn);

  AppState sentAgreement(bool sentAgreement);

  AppState shouldRedirectToTrainingsAfterLogin(
      bool shouldRedirectToTrainingsAfterLogin);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    bool? isLoggedIn,
    bool? sentAgreement,
    bool? shouldRedirectToTrainingsAfterLogin,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppState.copyWith.fieldName(...)`
class _$AppStateCWProxyImpl implements _$AppStateCWProxy {
  const _$AppStateCWProxyImpl(this._value);

  final AppState _value;

  @override
  AppState isLoggedIn(bool isLoggedIn) => this(isLoggedIn: isLoggedIn);

  @override
  AppState sentAgreement(bool sentAgreement) =>
      this(sentAgreement: sentAgreement);

  @override
  AppState shouldRedirectToTrainingsAfterLogin(
          bool shouldRedirectToTrainingsAfterLogin) =>
      this(
          shouldRedirectToTrainingsAfterLogin:
              shouldRedirectToTrainingsAfterLogin);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppState(...).copyWith(id: 12, name: "My name")
  /// ````
  AppState call({
    Object? isLoggedIn = const $CopyWithPlaceholder(),
    Object? sentAgreement = const $CopyWithPlaceholder(),
    Object? shouldRedirectToTrainingsAfterLogin = const $CopyWithPlaceholder(),
  }) {
    return AppState(
      isLoggedIn:
          isLoggedIn == const $CopyWithPlaceholder() || isLoggedIn == null
              ? _value.isLoggedIn
              // ignore: cast_nullable_to_non_nullable
              : isLoggedIn as bool,
      sentAgreement:
          sentAgreement == const $CopyWithPlaceholder() || sentAgreement == null
              ? _value.sentAgreement
              // ignore: cast_nullable_to_non_nullable
              : sentAgreement as bool,
      shouldRedirectToTrainingsAfterLogin:
          shouldRedirectToTrainingsAfterLogin == const $CopyWithPlaceholder() ||
                  shouldRedirectToTrainingsAfterLogin == null
              ? _value.shouldRedirectToTrainingsAfterLogin
              // ignore: cast_nullable_to_non_nullable
              : shouldRedirectToTrainingsAfterLogin as bool,
    );
  }
}

extension $AppStateCopyWith on AppState {
  /// Returns a callable class that can be used as follows: `instanceOfAppState.copyWith(...)` or like so:`instanceOfAppState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppStateCWProxy get copyWith => _$AppStateCWProxyImpl(this);
}
