import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/ui/components/svg_icon.dart';
import 'package:social_media/ui/home/home_page.dart';
import 'package:social_media/utils/assets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    final style = theme.textTheme;
    return Scaffold(
      body: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            HomePage(),
            Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgIcon(IconAsset.home),
                        color:  theme.bottomNavigationBarTheme.selectedItemColor,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chat_bubble_outline_rounded),
                        color: theme.bottomNavigationBarTheme.unselectedItemColor,
                      ),
                      SizedBox(
                        width: 72,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline_rounded),
                        color: theme.bottomNavigationBarTheme.unselectedItemColor,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.person_circle_fill),
                        color: theme.bottomNavigationBarTheme.unselectedItemColor,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ][0],
    );
  }
}
