enum AppRoute {
  signIn,
  home,
  profile,
  seatmap,
  helpList,
  writingVenues,
  writingSeatInfo,
  writingPerformance,
  writingReview,
  writingRating;

  String get path => '/$name';
}