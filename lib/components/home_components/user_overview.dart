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
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: Row(
        children: [
          // User image
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 24,
          ),
          const SizedBox(width: 18),
          // User name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Notification and messaging buttons
          IconButton(
            onPressed: () {
              // Notification button action
            },
            icon: SvgPicture.asset('assets/icons/message.svg'),
          ),
          IconButton(
            onPressed: () {
              // Messaging button action
            },
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      ),
    );
  }
}
