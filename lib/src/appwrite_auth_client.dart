import 'package:appwrite_auth_client/src/appwrite_user.dart';
import 'package:common_classes/common_classes.dart';

abstract class AppwriteAuthClient {
  /// Signs up a user with the provided [email] and [password].
  ///
  /// Returns a [Result] with the [AppwriteUser] if the sign up was successful.
  ///
  /// Throws an [AuthFailure] if the sign up failed.
  ///
  Future<Result<AppwriteUser>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  /// Signs in a user with the provided [email] and [password].
  ///
  /// Returns a [Result] with the [AppwriteUser] if the sign in was successful.
  ///
  /// Throws an [AuthFailure] if the sign in failed.
  ///
  Future<Result<AppwriteUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  ///
  /// Returns a [AuthFailure] if the sign out failed.
  ///
  Future<Result<void>> signOut();

  /// Updates the current user's name.
  ///
  /// Returns a [AuthFailure] if the update failed.
  ///
  Future<Result<void>> updateName({
    required String name,
  });

  /// Updates the current user's email.
  ///
  /// Returns a [AuthFailure] if the update failed.
  ///
  Future<Result<void>> updateEmail({
    required String email,
    required String password,
  });

  /// Updates the current user's password.
  ///
  /// Returns a [AuthFailure] if the update failed.
  ///
  Future<Result<void>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });

  /// Get account preferences.
  ///
  /// Returns a [Result] with the [Map<String,dynamic>] if the fetch was successful.
  ///
  /// Throws an [AuthFailure] if the fetch failed.
  ///
  Future<Result<Map<String, dynamic>>> getPrefs();

  /// Update account preferences.
  ///
  /// Returns a [Result] with the [Map<String,dynamic>] if the update was successful.
  ///
  /// Throws an [AuthFailure] if the update failed.
  ///
  Future<Result<Map<String, dynamic>>> updatePrefs({
    required Map<String, dynamic> prefs,
  });

  /// Returns the current user.
  ///
  /// Returns a [Result] with the [AppwriteUser] if the fetch was successful.
  ///
  /// Throws an [AuthFailure] if the fetch failed.
  ///
  Future<Result<AppwriteUser>> getCurrentUser();

  /// Send a password reset email to the given [email].
  ///
  /// Throws an [AuthFailure] if the send failed.
  ///
  Future<Result<void>> sendPasswordResetEmail({
    required String email,
  });

  /// Confirms the password reset with the given [code] and [password].
  ///
  /// Throws an [AuthFailure] if the confirm failed.
  ///
  Future<Result<void>> confirmPasswordReset({
    required String code,
    required String password,
  });

  /// Send email to verify the given [email].
  ///
  /// Throws an [AuthFailure] if the send failed.
  ///
  Future<Result<void>> sendEmailVerification({
    required String email,
  });

  /// Confirms the email verification with the given [code].
  ///
  /// Throws an [AuthFailure] if the confirm failed.
  ///
  Future<Result<void>> confirmEmailVerification({
    required String code,
  });

  /// Google Sign In
  ///
  /// Returns a [Result] with the [AppwriteUser] if the sign in was successful.
  ///
  /// Throws an [AuthFailure] if the sign in failed.
  ///
  Future<Result<AppwriteUser>> signInWithGoogle();

  /// Apple Sign In
  ///
  /// Returns a [Result] with the [AppwriteUser] if the sign in was successful.
  ///
  /// Throws an [AuthFailure] if the sign in failed.
  ///
  Future<Result<AppwriteUser>> signInWithApple();
}
