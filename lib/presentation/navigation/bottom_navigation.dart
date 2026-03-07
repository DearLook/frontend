import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dearlook/core/styles/color_styles.dart';
import 'package:dearlook/core/routing/route_paths.dart';

class BottomNavigation extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const BottomNavigation({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: body,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 250,
                height: 64,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                decoration: BoxDecoration(
                  color: ColorStyles.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _BottomNavItem(
                          iconPath: 'assets/icons/home.svg',
                          isSelected: currentPageIndex == 0,
                          selectedColor: ColorStyles.black,
                          unselectedColor: ColorStyles.grayB8,
                          onTap: () => onChangeIndex(0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 80),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: _BottomNavItem(
                          iconPath: 'assets/icons/mypage.svg',
                          isSelected: currentPageIndex == 1,
                          selectedColor: ColorStyles.black,
                          unselectedColor: ColorStyles.grayB8,
                          onTap: () => onChangeIndex(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                child: GestureDetector(
                  onTap: () => context.push(RoutePaths.dummy),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: ColorStyles.pointE5,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/navigation_img.svg',
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          ColorStyles.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.iconPath,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? selectedColor : unselectedColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}