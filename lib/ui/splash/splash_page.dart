import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media/ui/home/home_page.dart';
import 'package:social_media/utils/assets.dart';
import 'package:social_media/utils/labels.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    const int index = 0;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -490,
            top: -230,
            child: SvgPicture.asset(
              Assets.rectangleBg,
              height: 988,
              width: 988,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Text(
                  Labels.welcomeTo,
                  style: style.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  Labels.socially,
                  style: style.headlineLarge,
                ),
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: SvgPicture.asset(
                    Assets.vector,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (i) => Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(4),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(
                          side: BorderSide(),
                        ),
                        color: i == index ? Colors.black : null,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
          Positioned(
            right: -122,
            bottom: -122,
            child: SizedBox(
              height: 366,
              width: 366,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    SvgPicture.asset(Assets.buttonShape),
                    Column(
                      children: [
                        const Spacer(
                          flex: 151,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(
                              flex: 138,
                            ),
                            Text(
                              Labels.next,
                              style: style.titleLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                            const Spacer(
                              flex: 152,
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 184,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
