import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:expiro/features/app/app.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../configurations/configurations.dart';
import '../single_onboarding_page.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final controller = PageController();

  @override
  Widget build(BuildContext context) => ExpiroScaffold(
        showAppBar: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpandablePageView(
                controller: controller,
                children: [
                  SingleOnboardingPage(
                    illustration: Assets.images.stomachPain.image(),
                    tagline:
                        "Many of us have found ourselves using items even after they've"
                        ' passed their expiration date at least once',
                  ),
                  SingleOnboardingPage(
                    illustration: Assets.images.schedule.image(),
                    tagline: "Stay on top of your product's"
                        ' expiration dates with diligent tracking.',
                    flip: true,
                  ),
                  SingleOnboardingPage(
                    illustration: Assets.images.notifications.image(),
                    tagline: 'Get timely notifications before your '
                        'products reach their expiration date.',
                  ),
                ],
              ),
              SmoothPageIndicator(
                controller: controller,
                effect: SwapEffect(
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: kPadding,
                  dotWidth: kPadding * 4,
                  type: SwapType.yRotation,
                ),
                onDotClicked: (index) {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInCubic,
                  );
                },
                count: 3,
              ),
              const _LoginSignupActions()
            ],
          ),
        ),
      );
}

class _LoginSignupActions extends StatelessWidget {
  const _LoginSignupActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(
          kPadding * 4,
        ),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.push(const LoginRouter());
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      );
}
