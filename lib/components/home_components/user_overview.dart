import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserPreview extends StatelessWidget {
  final String imageUrl;
  final String name;

  const UserPreview({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate sizes and padding based on screen width
    final double padding = screenWidth * 0.04;
    final double avatarRadius = screenWidth * 0.06;
    final double iconSize = screenWidth * 0.06;
    final double fontSize = screenWidth * 0.045;

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [],
      ),
      child: Row(
        children: [
          // User image
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: avatarRadius,
          ),
          SizedBox(width: padding),
          // User name
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Notification and messaging buttons
          IconButton(
            onPressed: () {
              // Notification button action
            },
            icon: SvgPicture.asset(
              'assets/icons/message.svg',
              width: iconSize,
              height: iconSize,
            ),
          ),
          IconButton(
            onPressed: () {
              // Messaging button action
            },
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              width: iconSize,
              height: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
