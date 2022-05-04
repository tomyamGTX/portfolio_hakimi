import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BotChat extends StatefulWidget {
  const BotChat({
    Key? key,
    required List<String> message,
    required this.i,
  })  : _message = message,
        super(key: key);

  final List<String> _message;
  final int i;

  @override
  State<BotChat> createState() => _BotChatState();
}

class _BotChatState extends State<BotChat> {
  bool loading = true;

  void Function() get changeBool => () {
        setState(() {
          loading = false;
        });
      };

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(milliseconds: 1500), changeBool);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Chip(
            label: loading
                ? AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        '...',
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 500),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )
                : Text(
                    widget._message[widget.i],
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )),
        const SizedBox(
          width: 10,
        ),
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 18,
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
                'https://media.istockphoto.com/vectors/-vector-id1010001882?k=20&m=1010001882&s=612x612&w=0&h=6ZqzWlYBD3bT2EqJolzC3xbIKVVy350qMQmmS6B-Wd4='),
          ),
        )
      ],
    );
  }
}
