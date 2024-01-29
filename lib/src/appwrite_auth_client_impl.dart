import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_client/src/appwrite_auth_client.dart';
import 'package:appwrite_auth_client/src/appwrite_user.dart';
import 'package:appwrite_auth_client/src/auth_failure.dart';
import 'package:appwrite_auth_client/src/auth_failure_util.dart';
import 'package:common_classes/common_classes.dart';
import 'package:connectivity_client/connectivity_client.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class AppwriteAuthClientImpl implements AppwriteAuthClient {
  final Logger? _logger;

  final FutureOr<void> Function(Failure)? _telemetryOnError;

  final FutureOr<void> Function()? _telemetryOnSuccess;

  final Account _account;

  final ConnectivityClient _connectivityClient;

  AppwriteAuthClientImpl({
    Logger? logger,
    FutureOr<void> Function(Failure)? telemetryOnError,
    FutureOr<void> Function()? telemetryOnSuccess,
    required Client client,
  })  : _logger = logger,
        _telemetryOnError = telemetryOnError,
        _telemetryOnSuccess = telemetryOnSuccess,
        _account = Account(client),
        _connectivityClient = ConnectivityClientImpl(
          logger: logger,
          telemetryOnError: telemetryOnError,
          telemetryOnSuccess: telemetryOnSuccess,
        );

  @override
  Future<Result<AppwriteUser>> signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    _logger?.i('[START] Signing up with email and password');

    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        final userId = const Uuid().v4();

        await _account.create(
          userId: userId,
          email: email,
          password: password,
          name: name,
        );

        await _telemetryOnSuccess?.call();

        _logger?.i('''[SUCCESS] Signed up user with:
                        email: $email
                        userId: $userId
                        name: $name 
                       ''');

        return AppwriteUser(
          userId: userId,
          email: email,
          name: name,
        );
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Signing up with email and password with email: $email',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<Map<String, dynamic>>> getPrefs() async {
    _logger?.i('[START] Fetching user prefs');
    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        final prefs = await _account.getPrefs();

        _logger?.i('[SUCCESS] Fetched user prefs');

        return prefs.data;
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Fetching user prefs',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<AppwriteUser>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    _logger?.i('[START] Signing in with email: $email and password');

    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        await _account.createEmailSession(
          email: email,
          password: password,
        );

        final result = await _account.get();

        _telemetryOnSuccess?.call();

        _logger?.i('''[SUCCESS] Signed in user with:
                        email: $email
                       ''');

        return AppwriteUser(
          userId: result.$id,
          email: result.email,
          name: result.name,
          isVerified: result.emailVerification,
        );
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Signing in with email and password with email: $email',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> signOut() async {
    _logger?.i('[START] Signing out');
    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        await _account.deleteSessions();

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Signed out');
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Signing out',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> updateEmail(
      {required String email, required String password}) async {
    _logger?.i('[START] Updating email');
    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        await _account.updateEmail(
          email: email,
          password: password,
        );

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Updated email');
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Signing up with email and password with email: $email',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> updateName({required String name}) async {
    _logger?.i('[START] Updating name');
    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        await _account.updateName(
          name: name,
        );

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Updated name');
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Updating name: $name',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    _logger?.i('[START] Updating password');

    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }

    return Result.asyncGuard(
      () async {
        await _account.updatePassword(
          oldPassword: oldPassword,
          password: newPassword,
        );

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Updated password');
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Updating password',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<Map<String, dynamic>>> updatePrefs(
      {required Map<String, dynamic> prefs}) async {
    _logger?.i('[START] Updating prefs');
    final connectivityResult =
        await _connectivityClient.checkInternetConnection();

    if (connectivityResult is Error) {
      return Result.error(
        NoInternetConnectionFailure(),
      );
    }
    return Result.asyncGuard(
      () async {
        await _account.updatePrefs(
          prefs: prefs,
        );

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Updated prefs');

        return prefs;
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          failure = ParseErrorUtil.parseError(exception: e);
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Updating prefs',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> confirmPasswordReset(
      {required String code, required String password}) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<Result<AppwriteUser>> getCurrentUser() async {
    _logger?.i('[START] Fetching current user');
    return Result.asyncGuard(
      () async {
        final result = await _account.get();

        _telemetryOnSuccess?.call();

        _logger?.i('[SUCCESS] Fetched current user');

        return AppwriteUser(
          userId: result.$id,
          email: result.email,
          name: result.name,
          isVerified: result.emailVerification,
        );
      },
      onError: (e, s) {
        late AuthFailure failure;

        if (e is AppwriteException) {
          if (e.message == 'Unauthorized') {
            failure = UnauthenticatedFailure(
              error: e.message ?? 'Unauthenticated',
              stackTrace: s,
            );
          } else {
            failure = ParseErrorUtil.parseError(exception: e);
          }
        } else {
          failure = AuthUnknownFailure(
            error: e.toString(),
            stackTrace: s,
          );
        }

        _logger?.e(
          '[ERROR] Fetching current user',
          time: DateTime.now(),
          error: e,
          stackTrace: s,
        );

        _telemetryOnError?.call(failure);

        return failure;
      },
    );
  }

  @override
  Future<Result<void>> sendPasswordResetEmail({required String email}) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }
}
