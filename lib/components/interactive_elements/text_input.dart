import 'package:flutter/material.dart';

class MyTextInput extends StatefulWidget {
  final String placeholder;
  final Function(String) onChanged;
  final IconData? icon;
  final Color placeholderColor;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextInput(
      {super.key, required this.placeholder,
      required this.onChanged,
      this.icon,
      this.placeholderColor = Colors.grey,
      this.obscureText = false,
      required this.controller // Default is false (not obscure)
      });

  @override
  _MyTextInputState createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 239, 239),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          if (widget.icon != null) Icon(widget.icon, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
                  border: InputBorder.none,
                ),
                onChanged: widget.onChanged,
                controller: widget.controller,
                obscureText: widget.obscureText ? _obscureText : false,
                style: const TextStyle(
                  fontSize: 16.0,
                )),
          ),
          widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
