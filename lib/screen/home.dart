import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
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
        Container(
          height: MediaQuery.of(context).size.height * 0.32,
          decoration: const BoxDecoration(
              color: Color(0xffdb817b),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp_mt8ktwFMueMTO6yKOcC0yDRvYoQzMLHpxuXKplm9Tp_l4uQWJdImdgT021kDX4OzyY&usqp=CAU'))),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.6,
          right: MediaQuery.of(context).size.width * 0.02,
          child: GFImageOverlay(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            height: 400,
            width: 400,
            shape: BoxShape.circle,
            image: const NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/portfoliohakimi-b90b8.appspot.com/o/images%2Fkmi-removebg-preview.png?alt=media&token=ddcf4a26-5904-4136-84eb-6259bed2c22a',
                scale: 1),
            boxFit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.36,
          left: MediaQuery.of(context).size.width * 0.05,
          child: SizedBox(
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
          top: MediaQuery.of(context).size.height * 0.46,
          left: MediaQuery.of(context).size.width * 0.05,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'Bobbers',
                  color: Colors.lightBlueAccent),
              child: AnimatedTextKit(
                animatedTexts: [
                  for (int i = 0; i < subtitle.length; i++)
                    TyperAnimatedText(subtitle[i]),
                ],
                onTap: () {
                  if (kDebugMode) {
                    print("Tap Event");
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
