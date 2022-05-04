import 'package:flutter/material.dart';

class WalkThroughItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const WalkThroughItem({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
