import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  static String tag = '/SoicalScreen';

  const SocialWidget({Key? key}) : super(key: key);

  @override
  SocialWidgetState createState() => SocialWidgetState();
}

class SocialWidgetState extends State<SocialWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19),
      width: context.width(),
      height: 200,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Entypo.facebook_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.facebook.com/kimi.ezflutter');
              }),
              8.width,
              CircleAvatar(
                backgroundColor: Colors.white,
                child: const Icon(Icons.tiktok_rounded,
                        size: 24, color: Colors.black)
                    .onTap(() {
                  launch('https://www.tiktok.com/@hakimimdnoor');
                }),
              ),
              8.width,
              const Icon(Entypo.instagram_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch('https://www.instagram.com/kimi_mdnoor/');
              }),
              8.width,
              const Icon(Entypo.linkedin_with_circle,
                      size: 40, color: Colors.white)
                  .onTap(() {
                launch(
                    'https://www.linkedin.com/in/mohamad-hakimi-bin-mohamad-noor-11510720b/');
              }),
              8.width,
              Icon(FontAwesome.youtube, size: 30, color: Colors.white)
                  .onTap(() {
                launch(
                    'https://www.youtube.com/channel/UC5yL4ttlwmmSYc78fpT7eEw');
              }),
            ],
          ).withWidth(context.width() * 0.8),
          const Divider(height: 50, color: Colors.white24, thickness: 1)
              .withWidth(context.width() * 0.9),
          Flexible(
            child: AutoSizeText(
                '© 2022 My Website. All rights reserved | Designed by Hakimi Mdnoor',
                textAlign: TextAlign.center,
                maxLines: 4,
                style: primaryTextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
