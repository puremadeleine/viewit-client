import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viewith/ui/app_design.dart';
import 'package:viewith/ui/gen/assets.gen.dart';

class UploadPhotoButton extends StatelessWidget {
  const UploadPhotoButton({super.key, this.uploadedCount = 0, required this.maxCount, required this.onUploaded});

  final int uploadedCount;
  final int maxCount;
  final Function(List<XFile>) onUploaded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final List<XFile> files = await picker.pickMultiImage(limit: maxCount);
        onUploaded.call(files);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppDesign.colors.gray900,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8.0), // border 둥글기
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            children: [
              Assets.images.cameraFill.svg(),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text('$uploadedCount / $maxCount', style: AppDesign.typo.body2Bold(),);
  }
}