import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:dearlook/presentation/setting/widgets/setting_arrow_item.dart';
import 'package:dearlook/presentation/setting/widgets/setting_section.dart';
import 'package:dearlook/presentation/setting/widgets/setting_value_item.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: ColorStyles.grayF3,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: AppBar(
          backgroundColor: ColorStyles.grayF3,
          title: Text(
            '설정',
            style: TextStyles.titleTextMedium.copyWith(
              color: ColorStyles.black,
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            spacing: 16,
            children: [
              SettingSection(
                title: '약관 및 정책',
                children: [
                  SettingArrowItem(
                    title: '서비스 이용약관',
                    onTap: () {},
                  ),
                  SettingArrowItem(
                    title: '개인정보처리방침',
                    onTap: () {},
                  ),
                ],
              ),
              const SettingSection(
                title: '버전 정보',
                children: [
                  SettingValueItem(
                    title: '현재 버전',
                    value: '0.0.1',
                  ),
                ],
              ),
              const SettingSection(
                title: '고객 지원',
                children: [
                  SettingValueItem(
                    title: '문의하기',
                    value: 'dearlook@gmail.com',
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}