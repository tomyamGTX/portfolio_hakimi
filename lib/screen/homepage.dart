import 'package:flutter/material.dart';
import 'package:portfolio_hakimi/providers/home.provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _controller,
        children: const [
          BodyComponent(
            title: 'About Me',
            subtitle: [
              'My name is Mohamad Hakimi Bin Mohamad Noor.',
              'I am 23 years old.',
              'I live at Alor Setar, Kedah.'
            ],
          ),
          BodyComponent(
            title: 'Portfolio',
            subtitle: [
              'My name is Mohamad Hakimi Bin Mohamad Noor.',
              'My highest education is Bachelor Degree in Information System and Engineering.',
              'Currently i work as contract developer at AQ WISE SDN. BHD.',
              'I expert in Dart, PHP and Java programming languages.'
            ],
          ),
          BodyComponent(
            title: 'Contact',
            subtitle: [
              'My name is Mohamad Hakimi Bin Mohamad Noor.',
              'My contact number is +60 136595741.',
              'My email is hakimimdnoor90@gmail.com.'
            ],
          ),
        ],
      ),
      Container(
        color: Theme.of(context).primaryColor,
        height: 40,
        child: Consumer<HomeProvider>(builder: (context, app, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_filled),
              TextButton(
                  onPressed: () {
                    if (Provider.of<HomeProvider>(context, listen: false)
                            .index !=
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
                    if (Provider.of<HomeProvider>(context, listen: false)
                            .index !=
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
                    if (Provider.of<HomeProvider>(context, listen: false)
                            .index !=
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
      ),
    ]));
  }
}
