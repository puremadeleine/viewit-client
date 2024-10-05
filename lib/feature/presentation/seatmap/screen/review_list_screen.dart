
import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/widgets/bottom_sheet.dart';

import '../widget/seat_map.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.colors.white,
      body: Stack(
        children: [
          SeatMap(
            seatmapName: 'assets/seatmap/kspo.svg',
            stageName: 'assets/seatmap/kspo-t.svg',
            onSectionSelected: (id) {},
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45, // 초기 높이 (전체 화면 대비)
            minChildSize: 0.45, // 최소 높이
            maxChildSize: 0.95, // 최대 높이
            builder: (BuildContext context, ScrollController scrollController) {
              return VIBottomSheet<String>(
                controller: scrollController,
                widget: widget,
                items: ['test'],
                onItemSelected: (item) {},
                itemBuilder: (context, item) {
                  return Text(item);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
