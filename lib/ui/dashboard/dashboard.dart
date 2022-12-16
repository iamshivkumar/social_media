import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/ui/chats/conversations_page.dart';
import 'package:social_media/ui/components/svg_icon.dart';
import 'package:social_media/ui/home/home_page.dart';
import 'package:social_media/ui/profile/profile_page.dart';
import 'package:social_media/utils/assets.dart';

import '../components/app_floating_button.dart';

class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final index = useState<int>(0);

    const List<Widget> icons =  [
      SvgIcon(IconAsset.home),
      Icon(Icons.chat_bubble_outline_rounded),
      Icon(Icons.favorite_outline_rounded),
      Icon(CupertinoIcons.person_circle_fill)
    ];

    final List<Widget> navItems = icons
        .map(
          (e) {
            final i = icons.indexOf(e);
            return IconButton(
            onPressed: () {
              index.value = i;
            },
            icon: e,
            color: index.value == i? theme.bottomNavigationBarTheme.selectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
          );}
        )
        .toList();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AppFlotingButton(
        icon: Icon(Icons.add_circle_outline),
      ),
      body: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            [
              HomePage(),
              ConversationsPage(),
              Scaffold(),
              ProfilePage(),
            ][index.value],
            Material(
              color: theme.bottomNavigationBarTheme.backgroundColor,
              borderRadius: const BorderRadius.only(
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
                      navItems[0],
                      navItems[1],
                      const SizedBox(
                        width: 72,
                      ),
                      navItems[2],
                      navItems[3],
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
