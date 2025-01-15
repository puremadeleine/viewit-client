enum AppRoute {
  signIn,
  home,
  profile,
  seatmap,
  helpList,
  help,
  writingVenues,
  writingSeatInfo,
  writingPerformance,
  writingReview,
  writingRating;

  String get path => '/$name';
}