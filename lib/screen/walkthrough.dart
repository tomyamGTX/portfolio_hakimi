import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_hakimi/screen/walkthrough.item.dart';

import 'homepage.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  String url = '';

  @override
  void initState() {
    init();
    super.initState();
  }

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
        children: [
          WalkThroughItem(
            title: 'Welcome',
            subtitle: 'This is the first screen',
            url: url,
          ),
          WalkThroughItem(
            title: 'This is my portfolio',
            subtitle: 'This is the second screen',
            url: url,
          ),
          WalkThroughItem(
            title: 'Hope you like it',
            subtitle: 'This is the third screen',
            url: url,
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
          TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: const Text('Skip')),
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
              if (index == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
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

  Future<void> init() async {
    final ref =
        FirebaseStorage.instance.ref().child('images/kmi-removebg-preview.png');
// no need of the file extension, the name will do fine.
    var urls = await ref.getDownloadURL();
    setState(() {
      url = urls;
    });
    print(url);
  }
}
