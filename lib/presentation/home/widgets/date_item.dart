import 'package:flutter/material.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';

class DateItem extends StatelessWidget {
  final String weekday;
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const DateItem({
    super.key,
    required this.weekday,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              weekday,
              style: TextStyles.smallTextMedium.copyWith(
                color: isSelected ? ColorStyles.pointC9 : ColorStyles.gray72,
              ),
            ),
            Text(
              day,
              style: TextStyles.normalTextBold.copyWith(
                color: isSelected ? ColorStyles.pointC9 : ColorStyles.gray72,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: isSelected ? ColorStyles.pointC9 : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}