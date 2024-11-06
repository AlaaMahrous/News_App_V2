import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextOverflow textOverflow;
  final int maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.size = 18,  
    this.weight = FontWeight.normal,  
    this.color = Colors.black, 
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,  
      overflow: textOverflow,
      maxLines: maxLines, 
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
