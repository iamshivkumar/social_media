import 'package:flutter/material.dart';
import 'package:social_media/utils/labels.dart';

import '../../../utils/assets.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    Key? key,
    required this.index
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            Assets.homeImage(index+1),
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 7),
            color: theme.shadowColor,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  Assets.profile(3),
                ),
              ),
              title: Text(
                "Dennis Reynolds",
                style: TextStyle(
                  color: theme.cardColor,
                ),
              ),
              subtitle: Text(
                Labels.hrsAgo(2),
                style: TextStyle(
                  color: theme.cardColor.withOpacity(0.8),
                ),
              ),
              trailing: PopupMenuButton(
                onSelected: (v) {},
                icon: Icon(
                  Icons.more_vert,
                  color: theme.cardColor,
                ),
                itemBuilder: (context) => [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomChipButton(
                    icon: Icons.favorite_outline_rounded,
                    value: "4.3K",
                  ),
                  CustomChipButton(
                    icon: Icons.chat_bubble_outline_rounded,
                    value: "4.3K",
                  ),
                  CustomChipButton(
                    icon: Icons.bookmark_outline_rounded,
                    value: "4.3K",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChipButton extends StatelessWidget {
  const CustomChipButton(
      {Key? key, required this.icon, required this.value, this.onTap})
      : super(key: key);

  final String value;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return MaterialButton(
      height: 0,
      minWidth: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      color: theme.cardColor.withOpacity(0.35),
      onPressed: onTap ?? () {},
      textColor: theme.cardColor,
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
