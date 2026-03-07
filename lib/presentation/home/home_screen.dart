import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: Center(
          child: Text(
            '홈 페이지',
            style: TextStyles.largeTextBold.copyWith(
              color: ColorStyles.black,
            ),
          ),
        ),
      ),
    );
  }
}