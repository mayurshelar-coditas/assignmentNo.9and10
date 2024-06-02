import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/core/theme/fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = FilledButton.styleFrom(
      backgroundColor: AppPallete.signinButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Border radius
      ),
    );

    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: ColoredBox(
                color: AppPallete.whiteColor,
              ),
            ),
            const Expanded(
              flex: 8,
              child: ColoredBox(
                color: AppPallete.onBoardingContainerColor,
                child: Center(
                  child: Text('Image 3'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ColoredBox(
                color: AppPallete.whiteColor,
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    FilledButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      style: buttonStyle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Text(
                          translation(context).back,
                          style: Fonts.heebo(13, FontWeight.w500),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                    FilledButton(
                      onPressed: () async {
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        await pref.setBool('onBoardedOnce', true);
                        context.router.replaceAll(
                          <PageRouteInfo>[
                            const LoginRoute(),
                          ],
                        );
                      },
                      style: buttonStyle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Text(
                          translation(context).next,
                          style: Fonts.heebo(14, FontWeight.w500),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
