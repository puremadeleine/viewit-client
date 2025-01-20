import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viewith/feature/seatmap/presentation/widget/seat_map.dart';

import '../../../../app/route/app_route.dart';
import '../../../../ui/app_design.dart';
import '../../../../ui/widgets/button/vi_button.dart';
import '../../../../ui/widgets/button/vi_button_type.dart';
import '../domain/entity/option_field.dart';

class WritingSeatInfoScreen extends ConsumerWidget {
  const WritingSeatInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('좌석 정보를 입력해주세요'),
            _buildSubTitle('어떤 자리에서 공연을 관람하셨나요?'),
            AppDesign.spacing.h12,
            _buildSeatMap(context),
            _buildOptions(),
            const Spacer(),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Text(text, style: AppDesign.typo.title1());
  }

  Widget _buildSubTitle(String text) {
    return Text(text, style: AppDesign.typo.body2(color: AppDesign.colors.gray600));
  }

  Widget _buildSeatMap(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final height = screenSize.height * 0.35;
    return SizedBox(
      height: height,
      child: SeatMap(
        seatmapSource: 'assets/seatmap/kspo.svg',
        mode: const SeatMapWritable(),
        onSectionSelected: (section) {},
      ),
    );
  }

  Widget _buildOptions() {
    const dummy = [
      OptionField(label: '구역', items: ['a', 'b']),
      OptionField(label: '열', items: ['1', '2']),
      OptionField(label: '번호', items: [null, '1', '2']),
      OptionField(label: '블럭', items: [null, '왼블', '오블']),
    ];

    return Row(
      children: dummy.asMap().entries.map((entry) {
        final isFirst = entry.key == 0;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: isFirst ? 0 : 8.0),
            child: _buildDropdownButton(
              entry.value.label,
              entry.value.items,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdownButton(String label, List<String?> data) {
    return DropdownButtonFormField<String?>(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(fontSize: 15, color: Color(0xffcfcfcf)),
      ),
      onChanged: (String? newValue) {
        print(newValue);
      },
      items: data.map<DropdownMenuItem<String>>((String? key) {
        return DropdownMenuItem<String>(
          value: key,
          child: Text(key ?? '선택 안함'),
        );
      }).toList(),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return VIButton(
      onTap: () => context.pushNamed(AppRoute.writingPerformance.name),
      type: VIButtonType.primary,
      text: '다음',
    );
  }
}
