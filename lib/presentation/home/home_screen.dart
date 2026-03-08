import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';
import 'package:dearlook/presentation/home/widgets/date_item.dart';
import 'package:dearlook/presentation/home/widgets/empty_ootd_view.dart';
import 'package:dearlook/presentation/home/utils/home_date_utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  static const int _initialPage = 10000;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = DateUtils.dateOnly(DateTime.now());
    final selectedDate = useState<DateTime>(today);
    final pageController = usePageController(initialPage: _initialPage);

    final weekDates = HomeDateUtils.weekDates(selectedDate.value);
    final title = '${selectedDate.value.year}.${selectedDate.value.month.toString().padLeft(2, '0')}';

    return Scaffold(
      backgroundColor: ColorStyles.grayF3,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    child: Row(
                      spacing: 8,
                      children: [
                        Text(
                          title,
                          style: TextStyles.largeTextMedium.copyWith(
                            color: ColorStyles.black,
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          size: 24,
                          color: ColorStyles.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorStyles.grayB8,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: List.generate(weekDates.length, (index) {
                        final date = weekDates[index];
                        final isSelected = HomeDateUtils.isSameDate(date, selectedDate.value);

                        return Expanded(
                          child: DateItem(
                            weekday: HomeDateUtils.weekdayLabel(date.weekday),
                            day: date.day.toString(),
                            isSelected: isSelected,
                            onTap: () {
                              selectedDate.value = date;
                              final dayOffset = date.difference(today).inDays;
                              pageController.jumpToPage(
                                _initialPage + dayOffset,
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 40),
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (page) {
                    final dayOffset = page - _initialPage;
                    selectedDate.value = today.add(Duration(days: dayOffset));
                  },
                  itemBuilder: (context, index) {
                    return const EmptyOotdView();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}