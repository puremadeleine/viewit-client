enum SocialType { kakao, apple }

sealed class User {
  const User();
}

class AuthenticatedUser extends User {
  final String nickname;
  final SocialType type;

  const AuthenticatedUser({
    required this.nickname,
    required this.type,
  }) : super();
}

class AnonymousUser extends User {
  const AnonymousUser() : super();
}
