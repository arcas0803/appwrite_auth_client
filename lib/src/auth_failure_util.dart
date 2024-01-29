import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_client/src/auth_failure.dart';

class ParseErrorUtil {
  static AuthFailure parseError({required AppwriteException exception}) {
    switch (exception.type) {
      case 'user_password_mismatch':
        return PasswordMismatchFailure(
          error: exception.message ?? 'Password mismatch',
          stackTrace: StackTrace.current,
        );
      case 'password_recently_used':
        return PasswordRecentlyUsedFailure(
          error: exception.message ?? 'Password recently used',
          stackTrace: StackTrace.current,
        );
      case 'password_personal_data':
        return PasswordPersonalDataFailure(
          error: exception.message ?? 'Password contains personal data',
          stackTrace: StackTrace.current,
        );
      case 'user_blocked':
        return UserBlockedFailure(
          error: exception.message ?? 'User is blocked',
          stackTrace: StackTrace.current,
        );
      case 'user_invalid_credentials':
        return InvalidCredentialsFailure(
          error: exception.message ?? 'Invalid credentials',
          stackTrace: StackTrace.current,
        );
      case 'user_unauthorized':
        return UnauthenticatedFailure(
          error: exception.message ?? 'Unauthenticated',
          stackTrace: StackTrace.current,
        );

      case 'user_not_found':
        return UserNotFoundFailure(
          error: exception.message ?? 'User not found',
          stackTrace: StackTrace.current,
        );
      case 'user_already_exists':
        return EmailAlreadyInUseFailure(
          email: exception.message ?? 'User already exists',
          error: exception.message ?? 'User already exists',
          stackTrace: StackTrace.current,
        );
      case 'user_email_already_exists':
        return EmailAlreadyInUseFailure(
          email: exception.message ?? 'User email already exists',
          error: exception.message ?? 'User email already exists',
          stackTrace: StackTrace.current,
        );
      case 'user_password_reset_required':
        return UserPasswordResetRequiredFailure(
          error: exception.message ?? 'User password reset required',
          stackTrace: StackTrace.current,
        );
      default:
        return AuthUnknownFailure(
          error: exception.message ?? 'Unknown failure',
          stackTrace: StackTrace.current,
        );
    }
  }
}
