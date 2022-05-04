import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bot.chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference chat = FirebaseFirestore.instance.collection('chats');

  final List<String> _message = [];
  List _chip = [];
  final List<String> _response = [];
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    getData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    // Full date and time
    final result1 = simplyFormat(time: currentTime);
    return SizedBox(
      height: 700,
      width: 400,
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(result1),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: ListView.builder(
                  itemCount: _message.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (_message.isNotEmpty)
                          BotChat(message: _message, i: index),
                        if (_response.isNotEmpty && index < _response.length)
                          UserChat(message: _response, i: index),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: _chip.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _response.add(_chip[index]);
                                _chip.clear();
                                i++;
                              });
                              getData(i + 1);
                            },
                            child: Container(
                              width: 150,
                              height: 32,
                              child: Center(
                                child: Text(
                                  _chip[index],
                                  style: TextStyle(
                                      color: Theme.of(context).canvasColor),
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(8),
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData(int index) async {
    await chat.doc('$index').get().then((value) {
      setState(() {
        _message.add(value['text']);
        _chip = value['chip'];
      });
    });
    print(_message);
    print(_chip);
  }

  String simplyFormat({required DateTime time, bool dateOnly = false}) {
    String year = time.year.toString();

    // Add "0" on the left if month is from 1 to 9
    String month = time.month.toString().padLeft(2, '0');

    // Add "0" on the left if day is from 1 to 9
    String day = time.day.toString().padLeft(2, '0');

    // Add "0" on the left if hour is from 1 to 9
    String hour = time.hour.toString().padLeft(2, '0');

    // Add "0" on the left if minute is from 1 to 9
    String minute = time.minute.toString().padLeft(2, '0');

    // Add "0" on the left if second is from 1 to 9

    // If you only want year, month, and date
    if (dateOnly == false) {
      return "$hour:$minute";
    }

    // return the "yyyy-MM-dd HH:mm:ss" format
    return "$year-$month-$day";
  }
}

class UserChat extends StatelessWidget {
  const UserChat({
    Key? key,
    required List<String> message,
    required this.i,
  })  : _message = message,
        super(key: key);

  final List<String> _message;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 18,
          child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5lzrDfBdlpRtaWHCiUb3aN8xY2rgRumXgsDpZISndrsS57hqnFs9qyglW--3Gzw5SJYg&usqp=CAU')),
        ),
        const SizedBox(
          width: 10,
        ),
        Chip(
            label: Text(
          _message[i],
          maxLines: 3,
        )),
      ],
    );
  }
}
