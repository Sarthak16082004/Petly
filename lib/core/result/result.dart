/// Typed result type for use-case and repository return values.
sealed class Result<T> {
  const Result();
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);
  final AppFailure failure;
}

extension ResultX<T> on Result<T> {
  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;

  T get value => (this as Ok<T>).value;
  AppFailure get failure => (this as Err<T>).failure;

  R when<R>({
    required R Function(T value) ok,
    required R Function(AppFailure failure) err,
  }) {
    return switch (this) {
      Ok<T>(value: final v) => ok(v),
      Err<T>(failure: final f) => err(f),
    };
  }
}

/// Application-level typed failure hierarchy.
sealed class AppFailure {
  const AppFailure(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

final class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message, {this.field});
  final String? field;
}

final class DatabaseFailure extends AppFailure {
  const DatabaseFailure(super.message, {this.cause});
  final Object? cause;
}

final class FileStorageFailure extends AppFailure {
  const FileStorageFailure(super.message);
}

final class PermissionFailure extends AppFailure {
  const PermissionFailure(super.message);
}

final class NotificationFailure extends AppFailure {
  const NotificationFailure(super.message);
}

final class AuthenticationFailure extends AppFailure {
  const AuthenticationFailure(super.message);
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure(super.message);
}

final class DriveFailure extends AppFailure {
  const DriveFailure(super.message);
}

final class EncryptionFailure extends AppFailure {
  const EncryptionFailure(super.message);
}

final class IntegrityFailure extends AppFailure {
  const IntegrityFailure(super.message);
}

final class UnsupportedBackupFailure extends AppFailure {
  const UnsupportedBackupFailure(super.message);
}

final class UnexpectedFailure extends AppFailure {
  const UnexpectedFailure(super.message, {this.cause});
  final Object? cause;
}
