import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_pariwar/themes/themes.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

class MiniButton extends StatelessWidget {
  final String iconpath;
  final String text;
  final VoidCallback onClick;
  final bool selected;

  const MiniButton(
      {super.key,
      required this.iconpath,
      required this.text,
      required this.onClick,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: selected
            ? AppTheme.navClickColor
            : AppTheme.PaleBlueBg, // Grey fill color
        borderRadius: BorderRadius.circular(25), // Rounded border
        border: Border.all(
          color: const Color(0x14000000), // Border color #00000014
          width: 1.0, // Border width 1px
        ), // Blue border
      ),
      child: TextButton(
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconpath,
              height: 17,
              color: selected ? Colors.white : const Color(0xFF5D80B6),
            ),
            const SizedBox(width: 5), // Add spacing between icon and text
            Text(text,
                style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
