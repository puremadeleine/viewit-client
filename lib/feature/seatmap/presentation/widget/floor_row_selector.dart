import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

class FloorRowSelector extends StatefulWidget {
  const FloorRowSelector({super.key});

  @override
  State<FloorRowSelector> createState() => _FloorRowSelectorState();
}

class _FloorRowSelectorState extends State<FloorRowSelector> {
  String? selectedFloor; // 선택된 층
  String? selectedRow; // 선택된 열

  // 예제 데이터
  final List<String> floors = ['1층', '2층', '3층'];
  final List<String> rows = ['1열', '2열', '3열', '4열', '5열'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // 층 선택 버튼
        GestureDetector(
          onTap: () => _showSelectionDialog(
            context,
            title: '층 선택',
            options: floors,
            onSelected: (value) {
              setState(() {
                selectedFloor = value;
                selectedRow = null; // 층이 바뀌면 열 선택 초기화
              });
            },
          ),
          child: _buildChip(selectedFloor ?? '층 선택'),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: selectedFloor == null
              ? null // 층이 선택되지 않으면 비활성화
              : () => _showSelectionDialog(
                    context,
                    title: '열 선택',
                    options: rows,
                    onSelected: (value) {
                      setState(() {
                        selectedRow = value;
                      });
                    },
                  ),
          child: _buildChip(selectedRow ?? '열 선택', isDisabled: selectedFloor == null),
        ),
      ],
    );
  }

  Widget _buildChip(String text, {bool isDisabled = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isDisabled ? Colors.grey.shade300 : Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(text, style: AppDesign.typo.body2()),
          SizedBox(width: 8),
          Icon(
            Icons.arrow_drop_down,
            color: isDisabled ? Colors.grey.shade500 : Colors.black,
          ),
        ],
      ),
    );
  }

  void _showSelectionDialog(
    BuildContext context, {
    required String title,
    required List<String> options,
    required Function(String) onSelected,
  }) {
    showModalBottomSheet(
      backgroundColor: AppDesign.colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...options.map((option) {
              return ListTile(
                title: Text(option),
                onTap: () {
                  onSelected(option);
                  Navigator.pop(context); // 선택 후 닫기
                },
              );
            }).toList(),
            AppDesign.spacing.h24,
          ],
        );
      },
    );
  }
}
