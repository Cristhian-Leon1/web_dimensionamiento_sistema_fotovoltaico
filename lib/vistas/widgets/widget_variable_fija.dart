import 'package:flutter/material.dart';

class ContenedorVariable extends StatelessWidget {
  final String labelText;
  final ValueNotifier<double> valueNotifier;

  const ContenedorVariable({
    super.key,
    required this.labelText,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ValueListenableBuilder<double>(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return Text(
                value.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}