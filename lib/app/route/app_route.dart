enum AppRoute {
  signIn,
  home,
  profile,
  seatmap,
  writingVenues,
  writingSeatInfo,
  writingPerformance,
  writingReview;

  String get path => '/$name';
}