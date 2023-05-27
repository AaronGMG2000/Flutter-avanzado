import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? onPressed;
  const CustomButton({
    Key? key,
    this.text = 'Ingresar',
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: color,
        shape: const StadiumBorder(),
      ),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 18)),
      ),
    );
  }
}
