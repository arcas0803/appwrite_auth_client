import 'package:common_classes/common_classes.dart';

sealed class AuthFailure extends Failure {
  AuthFailure(
      {required super.message,
      required super.error,
      required super.stackTrace});
}

final class EmailAlreadyInUseFailure extends AuthFailure {
  EmailAlreadyInUseFailure({
    required String email,
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Email $email is already in use',
          error: error,
          stackTrace: stackTrace,
        );
}

final class InvalidCredentialsFailure extends AuthFailure {
  InvalidCredentialsFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Invalid credentials',
          error: error,
          stackTrace: stackTrace,
        );
}

final class UserDisabledFailure extends AuthFailure {
  UserDisabledFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'User is disabled',
          error: error,
          stackTrace: stackTrace,
        );
}

final class WeakPasswordFailure extends AuthFailure {
  WeakPasswordFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Password is too weak',
          error: error,
          stackTrace: stackTrace,
        );
}

final class UserNotFoundFailure extends AuthFailure {
  UserNotFoundFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'User not found',
          error: error,
          stackTrace: stackTrace,
        );
}

final class EmailUnverifiedFailure extends AuthFailure {
  EmailUnverifiedFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Email is not verified',
          error: error,
          stackTrace: stackTrace,
        );
}

final class UnauthenticatedFailure extends AuthFailure {
  UnauthenticatedFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'User is not authenticated',
          error: error,
          stackTrace: stackTrace,
        );
}

final class PasswordMismatchFailure extends AuthFailure {
  PasswordMismatchFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Password mismatch',
          error: error,
          stackTrace: stackTrace,
        );
}

final class PasswordRecentlyUsedFailure extends AuthFailure {
  PasswordRecentlyUsedFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Password recently used',
          error: error,
          stackTrace: stackTrace,
        );
}

final class PasswordPersonalDataFailure extends AuthFailure {
  PasswordPersonalDataFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Password contains personal data',
          error: error,
          stackTrace: stackTrace,
        );
}

final class UserBlockedFailure extends AuthFailure {
  UserBlockedFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'User is blocked',
          error: error,
          stackTrace: stackTrace,
        );
}

final class UserPasswordResetRequiredFailure extends AuthFailure {
  UserPasswordResetRequiredFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'User password reset required',
          error: error,
          stackTrace: stackTrace,
        );
}

final class AuthUnknownFailure extends AuthFailure {
  AuthUnknownFailure({
    required String error,
    required StackTrace stackTrace,
  }) : super(
          message: 'Unknown failure',
          error: error,
          stackTrace: stackTrace,
        );
}
