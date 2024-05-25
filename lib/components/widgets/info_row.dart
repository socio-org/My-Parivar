import 'package:flutter/material.dart';
import 'package:mera_pariwar/themes/themes.dart';

Widget buildInfoRow(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.dullColor,
            )),
        Text(
          value ?? '',
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
