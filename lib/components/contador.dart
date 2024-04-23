import '../constants.dart';
import 'package:flutter/material.dart';

class Contador extends StatelessWidget {
  final void Function() onIncrement;
  final void Function() onDecrement;
  final String label;
  final int value;
  const Contador({super.key, required this.onIncrement, required this.onDecrement, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: labelTextStyle,
        ),
        Text(
          value.toString(),
          style: numberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onDecrement,
              style: ElevatedButton.styleFrom(
                backgroundColor: activeCardColour,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
              onPressed: onIncrement,
              style: ElevatedButton.styleFrom(
                backgroundColor: activeCardColour,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.add),
            )
          ],
        )
      ],
    );
  }
}
