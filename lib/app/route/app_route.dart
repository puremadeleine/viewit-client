enum AppRoute {
  signIn,
  home,
  profile,
  seatmap,
  writingVenues,
  writingSeatInfo,
  writingPerformance,
  writingReview,
  writingRating;

  String get path => '/$name';
}