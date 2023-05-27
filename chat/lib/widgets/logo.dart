import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;
  const Logo({Key? key, this.text = 'Messenger'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(children: [
          const Image(image: AssetImage('assets/tag-logo.png')),
          const SizedBox(height: 20),
          Text(text, style: const TextStyle(fontSize: 30))
        ]),
      ),
    );
  }
}
