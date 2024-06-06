import 'package:aewallet/model/authentication_method.dart';
import 'package:aewallet/model/device_lock_timeout.dart';
import 'package:aewallet/model/device_unlock_option.dart';
import 'package:aewallet/model/privacy_mask_option.dart';
import 'package:aewallet/util/universal_platform.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication.freezed.dart';

@freezed
class Credentials with _$Credentials {
  const Credentials._();
  const factory Credentials.pin({
    required String pin,
  }) = PinCredentials;

  const factory Credentials.password({
    required String password,
  }) = PasswordCredentials;

  const factory Credentials.yubikey({
    required String otp,
  }) = YubikeyCredentials;
}

@freezed
class AuthenticationSettings with _$AuthenticationSettings {
  const factory AuthenticationSettings({
    required AuthMethod authenticationMethod,
    required bool pinPadShuffle,
    required UnlockOption lock,
    required LockTimeoutOption lockTimeout,
    required PrivacyMaskOption privacyMask,
  }) = _AuthenticationSettings;

  const AuthenticationSettings._();

  static final defaultValue = AuthenticationSettings(
    authenticationMethod: AuthMethod.pin,
    pinPadShuffle: false,
    lock: UnlockOption.yes,
    lockTimeout: LockTimeoutOption.oneMin,
    privacyMask: UniversalPlatform.isMobile
        ? PrivacyMaskOption.enabled
        : PrivacyMaskOption.disabled,
  );
}
