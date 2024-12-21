enum AppRoute {
  signIn,
  home,
  profile,
  seatmap,
  writingVenues;

  String get path => '/$name';
}