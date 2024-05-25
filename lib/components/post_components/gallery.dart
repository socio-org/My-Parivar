import 'package:multi_image_layout/multi_image_layout.dart';

class MultiImageViewerWrapper extends StatelessWidget {
  final List<String> images;
  final double height;
  final double width;

  const MultiImageViewerWrapper({
    super.key,
    required this.images,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MultiImageViewer(
        images: images.map((e) => ImageModel(imageUrl: e)).toList(),
        height: height,
        width: width);
  }
}
