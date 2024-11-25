enum Profile {
  contact('문의하기'),
  termsOfService('개인정보처리방침'),
  license('오픈소스라이센스'),
  version('버전정보'),
  logout('로그아웃'),
  withdraw('회원탈퇴');

  final String title;

  const Profile(this.title);
}