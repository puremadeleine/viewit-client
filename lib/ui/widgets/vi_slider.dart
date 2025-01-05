import 'package:flutter/material.dart';
import 'package:viewith/ui/app_design.dart';

class VISlider extends StatefulWidget {
  final double maxRating;
  final double initialRating;
  final Function(double) onRatingChanged;

  const VISlider({
    super.key,
    this.maxRating = 5.0,
    this.initialRating = 0.0,
    required this.onRatingChanged,
  });

  @override
  State<VISlider> createState() => _VISliderState();
}

class _VISliderState extends State<VISlider> {
  late double _currentRating;
  final GlobalKey _sliderKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  double _getEmojiPosition(BoxConstraints constraints) {
    if (_sliderKey.currentContext == null) return 0;

    final RenderBox renderBox = _sliderKey.currentContext!.findRenderObject() as RenderBox;
    const double startX = 8.0;
    final double endX = renderBox.size.width - 16.0;
    final double availableWidth = endX - startX;

    final position = startX + (availableWidth * (_currentRating / widget.maxRating));
    return position - 12;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 48.0,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: AppDesign.colors.red900,
                      inactiveTrackColor: AppDesign.colors.gray200,
                      trackShape: const RoundedRectSliderTrackShape(),
                      trackHeight: 8.0,
                      thumbShape: SliderComponentShape.noThumb,
                      overlayShape: SliderComponentShape.noOverlay,
                      overlayColor: Colors.transparent,
                      tickMarkShape: SliderTickMarkShape.noTickMark,
                    ),
                    child: Slider(
                      key: _sliderKey,
                      value: _currentRating,
                      min: 0,
                      max: widget.maxRating,
                      divisions: (widget.maxRating * 2).toInt(),
                      onChanged: (value) {
                        setState(() {
                          _currentRating = value;
                        });
                        widget.onRatingChanged(value);
                      },
                    ),
                  ),
                  Positioned(
                    left: _getEmojiPosition(constraints),
                    top: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppDesign.colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppDesign.colors.red900, width: 2)
                      ),
                      child: Text(
                        _getEmoji(_currentRating),
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Text(
          '${_getText(_currentRating)} ${_getEmoji(_currentRating)}',
          style: AppDesign.typo.body1Bold(),
        ),
        AppDesign.spacing.h8,
        _buildRatingText(),
      ],
    );
  }

  Widget _buildRatingText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _currentRating.toStringAsFixed(1),
            style: AppDesign.typo.body2Bold(
              color: AppDesign.colors.red900,
            ),
          ),
          TextSpan(text: ' / ', style: AppDesign.typo.body2(color: AppDesign.colors.gray900)),
          TextSpan(
            text: widget.maxRating.toStringAsFixed(1),
            style: AppDesign.typo.body2(color: AppDesign.colors.gray900),
          ),
        ],
      ),
    );
  }

  String _getEmoji(double rating) {
    if (rating >= 5.0) return '😍';
    if (rating >= 4.0) return '😊';
    if (rating >= 2.0) return '🙂';
    return '😡';
  }

  String _getText(double rating) {
    if (rating >= 5.0) return '최고에요!';
    if (rating >= 4.0) return '좋았어요.';
    if (rating >= 2.0) return '그저 그래요.';
    return '앉지 마세요.';
  }
}
