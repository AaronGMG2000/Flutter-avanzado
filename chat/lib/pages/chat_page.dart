import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = 'ChatPage';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ChatPage'),
      ),
    );
  }
}