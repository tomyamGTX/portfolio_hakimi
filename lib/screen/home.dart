import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class BodyComponent extends StatelessWidget {
  final String title;
  final List subtitle;

  const BodyComponent({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    title,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 250),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.6,
          right: 100,
          child: const GFImageOverlay(
            height: 400,
            width: 400,
            shape: BoxShape.circle,
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/portfoliohakimi-b90b8.appspot.com/o/images%2Fkmi-removebg-preview.png?alt=media&token=ddcf4a26-5904-4136-84eb-6259bed2c22a',
                scale: 1),
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.55,
          left: MediaQuery.of(context).size.width * 0.1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Bobbers',
                  color: Colors.lightBlueAccent),
              child: AnimatedTextKit(
                animatedTexts: [
                  for (int i = 0; i < subtitle.length; i++)
                    TyperAnimatedText(subtitle[i]),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
