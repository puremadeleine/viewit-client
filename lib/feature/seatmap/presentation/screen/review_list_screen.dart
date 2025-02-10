import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/app/route/app_route.dart';
import 'package:viewith/feature/seatmap/presentation/controller/review_list_controller.dart';
import 'package:viewith/feature/seatmap/presentation/controller/state/review_list_state.dart';
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
  double _minChildSize = 0.3;
  bool _isFilterMode = false;

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
            _buildBottomSheet(state)
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

  Widget _buildBottomSheet(AsyncValue<ReviewListState> state) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        initialChildSize: _minChildSize,
        minChildSize: _minChildSize,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return _isFilterMode
              ? _buildFilterScreen()
              : _buildReviews(
                  state.value?.reviews.value ?? [],
                  scrollController,
                );
        },
      ),
    );
  }

  Widget _buildReviews(List<Review> reviews, ScrollController scrollController) {
    return VIBottomSheet<Review>(
      controller: scrollController,
      widget: widget,
      items: reviews,
      onItemSelected: (item) {},
      titleBuilder: (context) => Row(
        children: [
          _buildFilterButton(),
        ],
      ),
      itemBuilder: (context, review) {
        return ReviewItem(
          imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
          concert: "공연명",
          seat: review.seatName,
          rating: review.rating,
          review: review.content,
          date: review.createdAt,
        );
      },
    );
  }

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: () {
        _openFilterMode();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppDesign.colors.gray900,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Assets.images.candlestickLight.svg(),
      ),
    );
  }

  Widget _buildFilterScreen() {
    return Container(
      decoration: BoxDecoration(
        color: AppDesign.colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: AppDesign.colors.gray200,
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _closeFilterMode
              ),
              Text("필터 설정", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 48),
            ],
          ),
          Expanded(
            child: Center(
              child: Text("필터 옵션을 추가하세요"),
            ),
          ),
        ],
      ),
    );
  }

  void _openFilterMode() {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _isFilterMode = true; //
      });
    });
  }

  void _closeFilterMode() {
    setState(() {
      _isFilterMode = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {

    });
  }
}
