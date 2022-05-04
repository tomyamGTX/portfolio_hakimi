import 'package:flutter/material.dart';

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
          style: const TextStyle(fontSize: 18),
          maxLines: 3,
        )),
      ],
    );
  }
}
