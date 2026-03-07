import 'package:flutter/material.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';

class SettingValueItem extends StatelessWidget {
  final String title;
  final String value;

  const SettingValueItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyles.normalTextMedium.copyWith(
                color: ColorStyles.gray6B,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyles.normalTextMedium.copyWith(
              color: ColorStyles.gray6B,
            ),
          ),
        ],
      ),
    );
  }
}