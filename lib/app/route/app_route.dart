enum AppRoute {
  signIn,
  home,
  profile,
  writingVenues;

  String get path => '/$name';
}