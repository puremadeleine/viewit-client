import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/app/route/app_route.dart';
import 'package:viewith/feature/seatmap/presentation/controller/review_list_controller.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/widgets/bottom_sheet.dart';

import '../../../../core/utils/svg_util.dart';
import '../../../../data/venue/response/review.dart';
import '../../../../ui/gen/assets.gen.dart';
import '../widget/review_item.dart';
import '../widget/seat_map.dart';

class ReviewListScreen extends ConsumerStatefulWidget {
  final String id;
  final String venueName;

  const ReviewListScreen({super.key, required this.id, required this.venueName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends ConsumerState<ReviewListScreen> {
  double _minChildSize = 0.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _calculateMinChildSize();
  }

  Future<void> _calculateMinChildSize() async {
    final Size screenSize = MediaQuery.of(context).size;
    final Size svgSize = await SvgUtil.getSize(context, 'assets/seatmap/kspo.svg');
    double scaledHeight = screenSize.width * (svgSize.height / svgSize.width);
    scaledHeight += 30;
    double availableHeight = screenSize.height - kToolbarHeight;
    _minChildSize = 1 - (scaledHeight / availableHeight);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reviewListControllerProvider(widget.id));
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppDesign.colors.white,
      body: state.when(
        data: (data) => Stack(
          children: [
            _buildSeatMap(),
            _buildReviews(data.reviews.value ?? []),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.venueName,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            AppDesign.spacing.w4,
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.helpList.name);
              },
              child: Assets.images.infoFill.svg(),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSeatMap() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SeatMap(
        seatmapSource: 'https://viewith-bucket.s3.ap-northeast-2.amazonaws.com/svg/kspo.svg',
        stageSource: 'assets/seatmap/kspo-t.svg',
        sourceType: SvgSource.url,
        mode: const SeatMapReadOnly(reviewCount: {'SEAT_17': 5}),
        onSectionSelected: (id) {
          print(id);
        },
      ),
    );
  }

  Widget _buildReviews(List<Review> reviews) {
    return DraggableScrollableSheet(
      initialChildSize: _minChildSize,
      minChildSize: _minChildSize,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return VIBottomSheet<Review>(
          controller: scrollController,
          widget: widget,
          items: reviews,
          onItemSelected: (item) {},
          itemBuilder: (context, review) {
            return ReviewItem(
              imageUrl: review.imageList[0],
              concert: "공연명",
              seat: review.seatName,
              rating: review.rating,
              review: review.content,
              date: review.createdAt,
            );
          },
        );
      },
    );
  }
}
