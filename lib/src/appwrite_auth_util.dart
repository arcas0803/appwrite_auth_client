import 'package:appwrite_auth_client/localization/appwrite_auth_localizations.dart';
import 'package:appwrite_auth_client/src/auth_failure.dart';
import 'package:flutter/widgets.dart';

class AuthFailureUtil {
  static String getFailureNameUI({
    required BuildContext context,
    required AuthFailure failure,
  }) {
    switch (failure) {
      case EmailAlreadyInUseFailure():
        return AppwriteAuthLocalizations.of(context)!.emailAlreadyExists;
      case InvalidCredentialsFailure():
        return AppwriteAuthLocalizations.of(context)!.invalidCredentials;
      case UserDisabledFailure():
        return AppwriteAuthLocalizations.of(context)!.userDisabled;
      case WeakPasswordFailure():
        return AppwriteAuthLocalizations.of(context)!.weakPassword;
      case UserNotFoundFailure():
        return AppwriteAuthLocalizations.of(context)!.userNotFound;
      case EmailUnverifiedFailure():
        return AppwriteAuthLocalizations.of(context)!.emailUnverified;
      case UnauthenticatedFailure():
        return AppwriteAuthLocalizations.of(context)!.unauthenticated;
      case PasswordMismatchFailure():
        return AppwriteAuthLocalizations.of(context)!.passwordMistmatch;
      case PasswordRecentlyUsedFailure():
        return AppwriteAuthLocalizations.of(context)!.passwordRecentlyUsed;
      case PasswordPersonalDataFailure():
        return AppwriteAuthLocalizations.of(context)!.passwordPersonalData;
      case UserBlockedFailure():
        return AppwriteAuthLocalizations.of(context)!.userBlocked;
      case UserPasswordResetRequiredFailure():
        return AppwriteAuthLocalizations.of(context)!.passwordResetRequired;
      default:
        return AppwriteAuthLocalizations.of(context)!.unknownError;
    }
  }
}
