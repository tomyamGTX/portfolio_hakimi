import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WalkThroughItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;
  final bool isAsset;

  const WalkThroughItem({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.isAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: isAsset
                ? Lottie.asset(url, repeat: true)
                : Lottie.network(url)),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
