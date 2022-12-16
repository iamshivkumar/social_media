import 'dart:math';

import 'package:flutter/material.dart';



class AppFlotingButton extends StatelessWidget {
  const AppFlotingButton({
    Key? key,
    required this.icon
  }) : super(key: key);
  
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Transform.rotate(
        angle: pi / 4,
        child: FloatingActionButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -pi / 4,
            child: icon,
          ),
        ),
      ),
    );
  }
}
