import 'package:flutter/material.dart';
import 'package:mera_pariwar/themes/themes.dart';

Widget ContactInfo(String phone, String email) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: AppTheme.navClickColor,
            ),
            const SizedBox(width: 12),
            Text(phone,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(Icons.email, color: AppTheme.navClickColor),
            const SizedBox(width: 12),
            Text(email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    ),
  );
}
