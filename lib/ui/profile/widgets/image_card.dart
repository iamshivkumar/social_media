import 'package:flutter/material.dart';



class ImageCard extends StatelessWidget {
  const ImageCard(this.name, {super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          name,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}