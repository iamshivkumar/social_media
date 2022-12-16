import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/utils/labels.dart';

import '../../utils/assets.dart';
import 'widgets/image_card.dart';
import 'widgets/profile_image_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final x = (92 * 3 * width) / 756;
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -width,
            left: -(width + x / 3),
            right: -width,
            child: SvgPicture.asset(
              Assets.squareBg,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ),
                ListView(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    const ProfileImageView(),
                    SizedBox(
                      height: width / 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: {
                          Labels.posts: "35",
                          Labels.followers: "1,552",
                          Labels.follows: "128"
                        }
                            .entries
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      e.key,
                                      style: style.titleMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      e.value,
                                      style: style.headlineSmall,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.photo_outlined,
                            size: 32,
                          ),
                        ),
                        const SizedBox(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outline_rounded,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ImageCard(Assets.image(1)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ImageCard(Assets.image(2)),
                                ImageCard(Assets.image(3)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



///   => (92 * 3* width )/756
///  => ?
