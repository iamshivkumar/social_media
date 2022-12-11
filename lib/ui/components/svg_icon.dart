import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.name, {super.key, this.color, this.size});
  final String name;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? iconSize = size ?? iconTheme.size;

    Color iconColor = color ?? iconTheme.color!;
    return SvgPicture.asset(
      name,
      height: iconSize,
      width: iconSize,
      color: iconColor,
    );
  }
}
