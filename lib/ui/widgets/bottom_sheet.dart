import 'package:flutter/widgets.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/foundation/spacing.dart';

class VIBottomSheet<T> extends StatelessWidget {
  final ScrollController controller;
  final Widget widget;
  final List<T> items;
  final Function(T) onItemSelected;
  final Widget Function(BuildContext)? titleBuilder;
  final Widget Function(BuildContext, T) itemBuilder;

  const VIBottomSheet({
    super.key,
    required this.controller,
    required this.widget,
    required this.items,
    required this.onItemSelected,
    this.titleBuilder,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
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
      child: Column(
        children: [
          if (titleBuilder != null) titleBuilder!(context),
          if (titleBuilder != null) AppDesign.spacing.h24,
          _buildListView(),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Flexible(
      child: ListView.separated(
        controller: controller,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onItemSelected(items[index]);
            },
            child: itemBuilder(context, items[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
      ),
    );
  }
}
