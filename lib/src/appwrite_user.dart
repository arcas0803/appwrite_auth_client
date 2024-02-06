enum AuthProvider {
  email('email'),
  google('google'),
  apple('apple');

  const AuthProvider(this.provider);

  final String provider;
}

extension AuthProviderX on AuthProvider {
  String get value => provider;

  static AuthProvider fromString(String provider) {
    switch (provider) {
      case 'email':
        return AuthProvider.email;
      case 'google':
        return AuthProvider.google;
      case 'apple':
        return AuthProvider.apple;
      default:
        return AuthProvider.email;
    }
  }
}

class AppwriteUser {
  final String userId;
  final String email;
  final String name;
  final AuthProvider provider;
  final bool isVerified;
  final String imageUrl;

  AppwriteUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.provider,
    this.isVerified = false,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'AppwriteUser(userId: $userId, email: $email, name: $name, provider: $provider, isVerified: $isVerified, imageUrl: $imageUrl)';
  }

  AppwriteUser copyWith({
    String? userId,
    String? email,
    String? name,
    AuthProvider? provider,
    bool? isVerified,
    String? imageUrl,
  }) {
    return AppwriteUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      provider: provider ?? this.provider,
      isVerified: isVerified ?? this.isVerified,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppwriteUser &&
        other.userId == userId &&
        other.email == email &&
        other.name == name &&
        other.provider == provider &&
        other.isVerified == isVerified &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        provider.hashCode ^
        isVerified.hashCode ^
        imageUrl.hashCode;
  }
}
