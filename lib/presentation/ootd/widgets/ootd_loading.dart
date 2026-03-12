import 'package:flutter/material.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:image_picker/image_picker.dart';

class OotdLoading extends StatelessWidget {
  final XFile selectedImage;

  const OotdLoading({
    super.key,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyles.normalTextMedium.copyWith(
      color: ColorStyles.gray6B,
    );
    return ColoredBox(
      color: Colors.white,
      child: SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 34,
                height: 34,
                child: CircularProgressIndicator(
                  color: ColorStyles.pointC9,
                  strokeWidth: 5,
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  style: baseStyle,
                  children: [
                    const TextSpan(text: '오늘의 OOTD '),
                    TextSpan(
                      text: '룩티커',
                      style: baseStyle.copyWith(
                        color: ColorStyles.pointC9,
                      ),
                    ),
                    const TextSpan(text: '를 \n만드는 중이에요...\n'),
                    const TextSpan(text: '잠시만 기다려 주세요!'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}