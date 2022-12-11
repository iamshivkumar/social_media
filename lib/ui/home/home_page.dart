import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/ui/colors.dart';
import 'package:social_media/utils/assets.dart';
import 'package:social_media/utils/labels.dart';

import 'widgets/feed_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          Positioned(
            left: -520,
            top: -124,
            child: SvgPicture.asset(
              Assets.rectangleBg,
              height: 813,
              width: 813,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: const Text(Labels.socially),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    Labels.feed,
                    style: style.headlineSmall,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 56,
                          width: 56,
                          decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                              gradient: AppColors.gradient),
                          child: Center(
                            child: SvgPicture.asset(
                              IconAsset.add,
                              height: 18,
                              width: 18,
                            ),
                          ),
                        ),
                      ),
                      ...List.generate(
                        8,
                        (index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 28,
                            child: Center(
                              child: CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage(
                                  Assets.profile(index + 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      FeedCard(index: 0,),
                      FeedCard(index: 1,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
