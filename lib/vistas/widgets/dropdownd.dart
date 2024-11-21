import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const DropdownWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text(hintText),
          value: value,
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}