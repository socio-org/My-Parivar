import 'package:flutter/material.dart';
import 'package:mera_pariwar/themes/themes.dart';

class PillButtonGroup extends StatefulWidget {
  final List<String> options;
  final ValueChanged<String> onSelected;

  const PillButtonGroup({super.key, required this.options, required this.onSelected});

  @override
  _PillButtonGroupState createState() => _PillButtonGroupState();
}

class _PillButtonGroupState extends State<PillButtonGroup> {
  String? _selectedOption = "List All";

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
    });
    widget.onSelected(option);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.options.map((option) {
          final isSelected = _selectedOption == option;
          return GestureDetector(
            onTap: () => _selectOption(option),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.navColor : Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border:
                    Border.all(color: isSelected ? Colors.blue : Colors.grey),
              ),
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
