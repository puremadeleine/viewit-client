import 'package:flutter/material.dart';
import 'package:viewith/feature/presentation/seatmap/model/review.dart';
import 'package:viewith/feature/presentation/seatmap/widget/review_item.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/widgets/bottom_sheet.dart';
import 'package:viewith/utils/svg_util.dart';

import '../widget/seat_map.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {

  double _minChildSize = 0.0;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '잠실실내체육관',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        backgroundColor: AppDesign.colors.white,
      ),
      backgroundColor: AppDesign.colors.white,
      body: Stack(
        children: [
          _buildSeatMap(),
          _buildReviews(),
        ],
      ),
    );
  }

  Widget _buildSeatMap() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SeatMap(
        seatmapName: 'assets/seatmap/kspo.svg',
        stageName: 'assets/seatmap/kspo-t.svg',
        mode: const SeatMapReadOnly(reviewCount: {'SEAT_17': 5}),
        onSectionSelected: (id) {
          print(id);
        },
      ),
    );
  }

  Widget _buildReviews() {
    return DraggableScrollableSheet(
      initialChildSize: _minChildSize,
      minChildSize: _minChildSize,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return VIBottomSheet<Review>(
          controller: scrollController,
          widget: widget,
          items: [
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            ),
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            ),
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            ),
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            ),
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            ),
            Review(
              imageUrl: 'https://tkfile.yes24.com/upload2/PerfBlog/202409/20240927/20240927-51057.jpg',
              seat: 'IVE - SHOW WHAT I HAVE',
              concert: '2구역 5열 03번',
              rating: 4.0,
              text: '그냥 안보여요. 돈 버리고 왔습니다. 어쩌구 저쩌구 구저쩌구 저쩌구 저쩌구 저쩌구 저쩌구 저쩌구...',
              date: '2일 전',
            )
          ],
          onItemSelected: (item) {},
          itemBuilder: (context, review) {
            return ReviewItem(
              imageUrl: review.imageUrl,
              concert: review.seat,
              seat: review.concert,
              rating: review.rating,
              review: review.text,
              date: review.date,
            );
          },
        );
      },
    );
  }
}

