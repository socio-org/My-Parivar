import 'package:flutter/material.dart';

class GalleryRow extends StatelessWidget {
  final List<String> imageUrls;

  const GalleryRow({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildGalleryItems(),
    );
  }

  List<Widget> _buildGalleryItems() {
    List<Widget> galleryItems = [];

    for (int i = 0; i < imageUrls.length && i < 3; i++) {
      galleryItems.add(
        Expanded(
          child: Stack(
            children: [
              Image.network(
                imageUrls[i],
                height: 100,
                fit: BoxFit.cover,
              ),
              if (i == 2 && imageUrls.length > 3)
                Container(
                  height: 100,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      "${imageUrls.length - 3}+",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

      if (i < imageUrls.length - 1 && i < 2) {
        galleryItems.add(const SizedBox(width: 8));
      }
    }

    return galleryItems;
  }
}
