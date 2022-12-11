import 'dart:math';

import 'package:flutter/material.dart';

import '../../../utils/assets.dart';


class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Column(
      children: [
        Center(
          child: Row(
            children: [
              Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Transform.scale(
                          scale: 1.25,
                          child: Transform.rotate(
                            angle: -pi / 4,
                            child: Image.asset(
                              Assets.image(2),
                              fit: BoxFit.cover,
                              scale: 2,
                              colorBlendMode: BlendMode.dstATop,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          'John Doe',
          style: style.headlineSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          '@johndoe',
          style: style.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}