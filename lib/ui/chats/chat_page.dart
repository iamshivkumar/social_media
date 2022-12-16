import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/ui/chats/widgets/conversation_card.dart';
import 'package:social_media/ui/components/app_floating_button.dart';
import 'package:social_media/ui/components/svg_icon.dart';
import 'package:social_media/utils/assets.dart';
import 'package:social_media/utils/labels.dart';

class Message {
  final String value;
  final bool isMe;

  Message(this.value, [this.isMe = false]);
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      Message("we r goin to c the lions"),
      Message("they are doing a feed thing event at the zoo.."),
      Message("when?", true),
      Message("see the lions or sea lions? also, is mac there with u??", true),
    ];

    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    final media = MediaQuery.of(context);
    final width = media.size.width - 16;
    final height = (255.73 * width) / 357.31;
    return Scaffold(
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView(
            padding: const EdgeInsets.all(8).copyWith(top: height + 16),
            children: messages
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment:
                          e.isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Material(
                        borderRadius: BorderRadius.circular(15).copyWith(
                          topLeft: e.isMe ? null : const Radius.circular(0),
                          topRight: !e.isMe ? null : const Radius.circular(0),
                        ),
                        color: scheme.surfaceVariant,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text(e.value),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    Assets.chatBg,
                    fit: BoxFit.fitWidth,
                  ),
                  SafeArea(
                    bottom: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                        ),
                        Expanded(
                          child: Center(
                            child: Row(
                              children: [
                                const Spacer(),
                                const ChatAvatar(radius: 35),
                                const Spacer(),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Charlie Kelly",
                                        style: style.titleLarge,
                                      ),
                                      Text(
                                        "Online",
                                        style: style.bodySmall,
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16 + media.viewPadding.bottom,
            left: 40,
            right: 40,
            child: Container(
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                shadows: [
                  BoxShadow(
                    blurRadius: 20,
                    offset: const Offset(0, 7),
                    color: theme.shadowColor,
                  ),
                ],
                color: theme.cardColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            border: InputBorder.none,
                            hintText: Labels.writeAMessage),
                      ),
                    ),
                    const AppFlotingButton(
                      icon: SvgIcon(IconAsset.send),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
