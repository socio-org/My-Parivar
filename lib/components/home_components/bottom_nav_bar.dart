import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavItem {
  final String iconpath;
  final String text;
  final VoidCallback onClick;

  BottomNavItem({
    required this.iconpath,
    required this.text,
    required this.onClick,
  });
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? itemColor;
  final Color? selectedItemColor;

  const CustomBottomNavigationBar({super.key, 
    required this.items,
    required this.currentIndex,
    this.backgroundColor,
    this.itemColor,
    this.selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: item.onClick,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  item.iconpath,
                  // ignore: deprecated_member_use
                  color: isSelected ? selectedItemColor : itemColor,
                  height: 24,
                ),
                const SizedBox(height: 5),
                Text(
                  item.text,
                  style: TextStyle(
                      color: isSelected ? selectedItemColor : itemColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
