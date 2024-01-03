import 'package:app/Components/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollableWrapperBackground extends StatelessWidget {
  const ScrollableWrapperBackground({
    super.key,
    required this.dragPosition,
    required this.isLeft,
    required this.scrollLimit,
  });

  final double dragPosition;
  final bool isLeft;
  final double scrollLimit;
  final double aspectRatioIconContainer = 1 / 4;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final Color svgColor = isLeft ? Colors.deepPurple : Colors.teal;
    // Use Layout to get the available width to set specific dimensions for the background
    return Positioned.fill(
      bottom: 4,
      top: 4,
      right: isLeft ? 0 : screenWidth - 64 - 100,
      left: isLeft ? screenWidth - 64 - 100 : 0,
      child: Opacity(
        opacity: (dragPosition / scrollLimit).abs(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Config.cardBorderRadius),
              bottomRight: Radius.circular(Config.cardBorderRadius),
            ),
          ),
          child: Center(
            child: AspectRatio(
              aspectRatio: aspectRatioIconContainer,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                isLeft ? Config.leftArrowPath : Config.rightArrowPath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
