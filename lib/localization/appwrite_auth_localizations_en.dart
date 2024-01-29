import 'appwrite_auth_localizations.dart';

/// The translations for English (`en`).
class AppwriteAuthLocalizationsEn extends AppwriteAuthLocalizations {
  AppwriteAuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailAlreadyExists => 'Email already exists. Please try again with a different email.';

  @override
  String get invalidCredentials => 'Invalid credentials. Please try again with valid credentials.';

  @override
  String get userDisabled => 'User has been disabled. Please contact the administrator.';

  @override
  String get userNotFound => 'User not found. Please try again with a different email.';

  @override
  String get weakPassword => 'Password is too weak. Please try again with a stronger password with at least 8 characters.';

  @override
  String get emailUnverified => 'Email is not verified. Please verify your email.';

  @override
  String get unauthenticated => 'Unauthenticated. Please login to continue.';

  @override
  String get passwordMistmatch => 'Password mismatch. Please try again with the same password.';

  @override
  String get passwordRecentlyUsed => 'Password has been recently used. Please try again with a different password.';

  @override
  String get passwordPersonalData => 'Password contains personal data. Please try again with a different password.';

  @override
  String get userBlocked => 'User has been blocked. Please contact the administrator.';

  @override
  String get passwordResetRequired => 'Password reset required. Please reset your password.';

  @override
  String get unknownError => 'Unknown error. Please try again later.';
}
