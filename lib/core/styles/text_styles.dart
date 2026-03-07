import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle titleTextBold = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static TextStyle largeTextBold = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );
  static TextStyle normalTextBold = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static TextStyle smallTextBold = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleTextMedium = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static TextStyle largeTextMedium = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
  static TextStyle normalTextMedium = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle smallTextMedium = const TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}