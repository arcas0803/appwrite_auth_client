class AppwriteUser {
  final String userId;
  final String email;
  final String name;
  final bool isVerified;

  AppwriteUser({
    required this.userId,
    required this.email,
    required this.name,
    this.isVerified = false,
  });

  @override
  String toString() {
    return 'AppwriteUser(userId: $userId, email: $email, name: $name, isVerified: $isVerified)';
  }

  AppwriteUser copyWith({
    String? userId,
    String? email,
    String? name,
    bool? isVerified,
  }) {
    return AppwriteUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppwriteUser &&
        other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.isVerified == isVerified;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        isVerified.hashCode;
  }
}
