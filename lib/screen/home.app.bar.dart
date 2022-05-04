import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/home.provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required PageController controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Consumer<HomeProvider>(builder: (context, app, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  if (Provider.of<HomeProvider>(context, listen: false).index !=
                      0) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .goToPage(0);
                    _controller.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.slowMiddle);
                  }
                },
                child: Text(
                  'About Me',
                  style: TextStyle(
                      color: app.index == 0
                          ? Colors.tealAccent
                          : Theme.of(context).secondaryHeaderColor),
                )),
            TextButton(
                onPressed: () {
                  if (Provider.of<HomeProvider>(context, listen: false).index !=
                      1) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .goToPage(1);
                    _controller.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.slowMiddle);
                  }
                },
                child: Text(
                  'PortFolio',
                  style: TextStyle(
                      color: app.index == 1
                          ? Colors.tealAccent
                          : Theme.of(context).secondaryHeaderColor),
                )),
            TextButton(
                onPressed: () {
                  if (Provider.of<HomeProvider>(context, listen: false).index !=
                      2) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .goToPage(2);
                    _controller.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.slowMiddle);
                  }
                },
                child: Text(
                  'Contact',
                  style: TextStyle(
                      color: app.index == 2
                          ? Colors.tealAccent
                          : Theme.of(context).secondaryHeaderColor),
                )),
            IconButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse('https://www.facebook.com/siti.a.husna.5'));
                },
                icon: const Icon(Icons.facebook)),
            IconButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse('https://www.tiktok.com/@hakimimdnoor'));
                },
                icon: const Icon(Icons.tiktok_outlined)),
          ],
        );
      }),
    );
  }
}
