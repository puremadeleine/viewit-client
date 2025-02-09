import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viewith/data/venue/response/venue_detail.dart';

import '../../../../../data/venue/response/review.dart';

part 'review_list_state.freezed.dart';

@freezed
class ReviewListState with _$ReviewListState {
  factory ReviewListState({
    required AsyncValue<VenueDetail> seatInfo,
    required AsyncValue<List<Review>> reviews,
    String? selectedSection,
  }) = _ReviewListState;
}