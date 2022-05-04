import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class WalkThroughItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;

  const WalkThroughItem({
    required this.title,
    required this.subtitle,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFImageOverlay(
          height: 200,
          width: 200,
          shape: BoxShape.circle,
          image: NetworkImage(url),
          boxFit: BoxFit.cover,
        ),
        const SizedBox(
          height: 30,
        ),
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
