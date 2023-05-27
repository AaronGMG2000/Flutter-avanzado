import 'package:chat/pages/register_page.dart';
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String routeName;
  final String question;
  final String textButton;
  const Labels({
    Key? key,
    this.routeName = RegisterPage.routeName,
    this.question = '¿No tienes cuenta?',
    this.textButton = 'Crear una ahora!',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, routeName),
          child: Text(
            textButton,
            style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
