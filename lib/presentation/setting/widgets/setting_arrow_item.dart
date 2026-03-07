
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SettingArrowItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingArrowItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
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
              const Icon(
                Icons.chevron_right,
                size: 24,
                color: ColorStyles.grayB8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}