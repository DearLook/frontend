import 'package:flutter/cupertino.dart';

void showImageActionSheet(BuildContext context) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // 사진 촬영 로직
            },
            child: const Text(
              '사진 촬영',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // 앨범 선택 로직
            },
            child: const Text(
              '앨범에서 선택',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            '취소',
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
      );
    },
  );
}