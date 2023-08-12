import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class LoginProvidersPage extends StatelessWidget {
  const LoginProvidersPage({super.key});

  @override
  Widget build(BuildContext context) => ExpiroScaffold(
        showAppBar: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              StackedIllustration(
                illustration: Assets.images.login.image(
                  height: 280,
                  width: 280,
                ),
              ),
              const DescriptionContent(
                tagline: 'Get ready to witness the power of Expiro!',
                verticalPadding: kPadding * 2,
              ),
              const SizedBox(
                height: kPadding * 4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding * 4),
                child: _LoginSheet(),
              )
            ],
          ),
        ),
      );
}

class _LoginSheet extends StatelessWidget {
  const _LoginSheet({Key? key}) : super(key: key);

  final dividerColor = Colors.black38;
  final dividerHeight = kPadding / 8;
  final buttonSpacingSizedBox = const SizedBox.square(
    dimension: kPadding * 2,
  );

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          AuthButton(
            icon: FontAwesomeIcons.google,
            provider: 'google',
            label: 'Continue with Google',
            authButtonType: AuthButtonType.outlined,
          ),
          SizedBox(
            height: kPadding * 4,
          ),
          AuthButton(
            icon: FontAwesomeIcons.github,
            provider: 'github',
            label: 'Continue with GitHub',
            authButtonType: AuthButtonType.outlined,
          ),
          SizedBox(
            height: kPadding * 4,
          ),
        ],
      );
}
