import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/styles/text_styles.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
  });

  static const int _initialPage = 10000;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = _dateOnly(DateTime.now());
    final selectedDate = useState<DateTime>(today);
    final pageController = usePageController(initialPage: _initialPage);

    final weekDates = _weekDates(selectedDate.value);
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
                        final isSelected = _isSameDate(date, selectedDate.value);

                        return Expanded(
                          child: _DateItem(
                            weekday: _weekdayLabel(date.weekday),
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
                    return const _EmptyOotdView();
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

class _DateItem extends StatelessWidget {
  final String weekday;
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateItem({
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

class _EmptyOotdView extends StatelessWidget {
  const _EmptyOotdView();

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

DateTime _dateOnly(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

DateTime _startOfWeek(DateTime date) {
  final normalized = _dateOnly(date);
  final daysFromSunday = normalized.weekday % 7;
  return normalized.subtract(Duration(days: daysFromSunday));
}

List<DateTime> _weekDates(DateTime selectedDate) {
  final start = _startOfWeek(selectedDate);
  return List.generate(7, (index) => start.add(Duration(days: index)));
}

bool _isSameDate(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}

String _weekdayLabel(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return '';
  }
}