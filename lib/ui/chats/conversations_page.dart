import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/utils/labels.dart';

import '../../utils/assets.dart';
import 'widgets/conversation_card.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final left = (274 * width) / 365;
    final right = (217 * width) / 365;
    final bottom = (250 * media.size.height) / 812;
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: -bottom,
            left: -left,
            right: -right,
            child: SvgPicture.asset(
              Assets.conversationsBg,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu_rounded),
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(8).copyWith(
                bottom: media.viewPadding.bottom + kBottomNavigationBarHeight + 16,
              ),
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Labels.messages,
                    style: style.headlineSmall,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: const Offset(0, 7),
                        color: theme.shadowColor,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(CupertinoIcons.search),
                      hintText: Labels.searchForContacts,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ConversationCard(),
                ConversationCard(),
                ConversationCard(),
                ConversationCard(),
                ConversationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
