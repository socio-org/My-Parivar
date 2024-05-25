import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LikeSharePinBar extends StatelessWidget {
  final bool liked;
  final VoidCallback onLiked;
  final VoidCallback onShared;
  final VoidCallback onPinned;

  const LikeSharePinBar({
    super.key,
    required this.liked,
    required this.onLiked,
    required this.onShared,
    required this.onPinned,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onLiked,
          icon: SvgPicture.asset(
            liked ? 'assets/icons/like.svg' : 'assets/icons/nolike.svg',
            color: liked ? Colors.red : null,
          ),
        ),
        const Text(
          "Favorite",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 20), // Add spacing between like and share (20px
        IconButton(
          onPressed: onShared,
          icon: SvgPicture.asset(
            "assets/icons/share.svg",
            color: Colors.black,
          ),
        ),
        const Text(
          "Share",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
