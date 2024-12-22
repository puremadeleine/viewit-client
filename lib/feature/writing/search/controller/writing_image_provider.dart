// image_state.dart
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'writing_image_provider.g.dart';

@riverpod
class WritingImageProvider extends _$WritingImageProvider {
  @override
  List<XFile> build() {
    return [];
  }

  void addImages(List<XFile> files) {
    state = [...state, ...files];
  }

  void removeImage(int index) {
    final newList = [...state];
    newList.removeAt(index);
    state = newList;
  }
}