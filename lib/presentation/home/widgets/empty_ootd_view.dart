import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';

class EmptyOotdView extends StatelessWidget {
  const EmptyOotdView({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: ColorStyles.grayB8,
        strokeWidth: 2,
        dashPattern: const [6, 4],
        radius: const Radius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              '오늘의 OOTD를 등록하고\n룩티커를 만나보세요!',
              textAlign: TextAlign.center,
              style: TextStyles.normalTextMedium.copyWith(
                color: ColorStyles.gray6B,
                height: 1.4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '이미지 등록',
                  style: TextStyles.smallTextBold.copyWith(
                    color: ColorStyles.pointC9,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: ColorStyles.pointC9,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}