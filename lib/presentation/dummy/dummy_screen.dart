import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DummyScreen extends HookConsumerWidget {
  const DummyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: Center(
          child: Text(
            '더미',
            style: TextStyles.largeTextBold.copyWith(
              color: ColorStyles.black,
            ),
          ),
        ),
      ),
    );
  }
}