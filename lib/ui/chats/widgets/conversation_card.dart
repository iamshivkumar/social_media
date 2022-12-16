import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_media/ui/chats/chat_page.dart';

import '../../../utils/assets.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
            ),
          );
        },
        child: Material(
          borderRadius: BorderRadius.circular(32),
          color: theme.cardColor.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatAvatar(
                  radius: 30,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Malena Tudi",
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Hey, how’s it goin?",
                        style: style.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({Key? key, required this.radius}) : super(key: key);

  final double radius;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: Container(
        height: (radius * 2) + 8,
        width: (radius * 2) + 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Transform.rotate(
              angle: pi / 4,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(
                  Assets.profile(2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// (866.45 8 width)/ 365 => 
// x / 