import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_hakimi/models/project.models.dart';
import 'package:portfolio_hakimi/screen/social.widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  late int age;
  final List<Project> _image = [
    Project(
        name: 'Isign',
        colorIndex: 0,
        link:
            'https://play.google.com/store/apps/details?id=my.gov.onegovappstore.isign'),
    Project(
        name: 'ezFlutter',
        colorIndex: 1,
        link:
            'https://play.google.com/store/apps/details?id=com.kimi.ezFlutter'),
    Project(
        name: 'QuranIrab',
        colorIndex: 2,
        link: 'https://quranirab-74bba.web.app/#/'),
  ];
  final _scrollController = ScrollController();

  Future<bool> _onWillPop() async {
    return (await Fluttertoast.showToast(
            msg: "Press back again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0)) ??
        false;
  }

  @override
  void initState() {
    age = DateTime.now().year - 1999;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen())),
            child: const Icon(Icons.chat),
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            physics: const ScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                index = 0;
                              });
                            },
                            child: Text(
                              'Home',
                              style: TextStyle(
                                  color: index == 0
                                      ? Colors.tealAccent
                                      : Theme.of(context).secondaryHeaderColor,
                                  fontSize: 25),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                index = 1;
                                _scrollController.animateTo(2700,
                                    curve: Curves.ease,
                                    duration: const Duration(seconds: 2));
                              });
                            },
                            child: Text(
                              'Project Involve',
                              style: TextStyle(
                                  color: index == 1
                                      ? Colors.tealAccent
                                      : Theme.of(context).secondaryHeaderColor,
                                  fontSize: 25),
                            )),
                      ],
                    ),
                  ),
                  Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_sy6jjyct.json'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    child: ListTile(
                      title: Text(
                        'About Me',
                        style: boldTextStyle(size: 32),
                      ),
                      subtitle: AutoSizeText(
                        'My name is Mohamad Hakimi Bin Mohamad Noor. I am $age years old and live in Alor Setar, Kedah, Malaysia. Currently I work as Project Manager at AQ Wise SDN. BHD. I expertise in Dart, PHP, and some basic at Java language. Familiar with Flutter, GitHub, Firebase and Wordpress.',
                        style: primaryTextStyle(size: 24),
                        textAlign: TextAlign.justify,
                        maxLines: 10,
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: Text(
                          'Project Involves',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16),
                      child: Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        runSpacing: 20,
                        children: _image
                            .map((e) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          launchUrl(Uri.parse(e.link!)),
                                      child: Chip(
                                        backgroundColor: Colors
                                            .primaries[e.colorIndex!].shade200,
                                        label: TextButton(
                                          onPressed: () =>
                                              launchUrl(Uri.parse(e.link!)),
                                          child: Text(
                                            e.name!,
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.1,
                  ),
                  SocialWidget()
                ]),
          ),
        ),
      ),
    );
  }
}
