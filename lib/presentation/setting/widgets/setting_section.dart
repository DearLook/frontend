import 'package:flutter/material.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';

class SettingSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.normalTextMedium.copyWith(
              color: ColorStyles.gray46,
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: ColorStyles.grayB8, height: 1,),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}