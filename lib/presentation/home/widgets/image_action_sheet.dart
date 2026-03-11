import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

void showImageActionSheet({
  required BuildContext context,
  required Function(XFile?) onImageSelected,
}) {
  final ImagePicker picker = ImagePicker();

  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              // 계정 확인 및 테스트 필요
              final XFile? image = await picker.pickImage(
                source: ImageSource.camera,
                imageQuality: 80,
              );
              onImageSelected(image);
            },
            child: const Text(
              '사진 촬영',
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              final XFile? image = await picker.pickImage(
                source: ImageSource.gallery,
              );
              onImageSelected(image);
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