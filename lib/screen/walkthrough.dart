import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_hakimi/screen/walkthrough.item.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  final _contoller = PageController();
  double index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTop(),
          buildBottom(),
        ],
      ),
    );
  }

  buildTop() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: PageView(
        children: const [
          WalkThroughItem(
            title: 'Welcome',
            subtitle: 'This is first screen',
          ),
          WalkThroughItem(
            title: 'This is my portfolio',
            subtitle: 'This is second page',
          ),
          WalkThroughItem(
            title: 'Hope you like it',
            subtitle: 'This is third screen',
          ),
        ],
        controller: _contoller,
      ),
    );
  }

  buildBottom() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(onPressed: () {}, child: const Text('Skip')),
          DotsIndicator(
            onTap: (i) {
              setState(() {
                index = i;
              });

              _contoller.animateToPage(int.parse('$i'),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            dotsCount: 3,
            position: index,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (index < 2) index++;
              });
              _contoller.animateToPage(int.parse('$index'),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
