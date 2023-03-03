import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  // the values we need
  final String text;
  final IconData icon;
  final Color color;
  final TextStyle style;
  final VoidCallback onPressed;

  InfoCard(
      {required this.text, required this.icon, required this.onPressed,required this.color,required this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFF75A843),),
          title: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}