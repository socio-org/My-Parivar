import 'package:flutter/material.dart';

class FullImageGalleryPage extends StatelessWidget {
  final List<String> imageUrls;

  const FullImageGalleryPage({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gallery',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1, // Ensures a square grid
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
