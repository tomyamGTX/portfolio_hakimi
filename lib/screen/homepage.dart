import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio_hakimi/providers/home.provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'chat.dart';
import 'home.app.bar.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  List _image = [];

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
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              physics: const ScrollPhysics(),
              child: Column(children: [
                HomeAppBar(controller: _controller),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView(
                    onPageChanged: (index) {
                      Provider.of<HomeProvider>(context, listen: false)
                          .goToPage(index);
                    },
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
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Project Involves',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: GridView.builder(
                      itemCount: _image.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (_image.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_image[index]))),
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                          );
                        }
                        return Container();
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 1.6),
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }

  Future<void> init() async {
    final storageRef = FirebaseStorage.instance.ref().child('prevWorks');
    final listResult = await storageRef.listAll();
    for (var item in listResult.items) {
      var urls = await item.getDownloadURL();
      setState(() {
        _image.add(urls);
      });
    }
  }
}
