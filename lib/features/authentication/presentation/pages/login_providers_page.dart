import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:expiro/features/authentication/data/repo/social_auth0_repo.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginProvidersPage extends StatelessWidget {
  const LoginProvidersPage({super.key});

  @override
  Widget build(BuildContext context) => ExpiroScaffold(
        showAppBar: false,
        body: ListView(
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
  Widget build(BuildContext context) => Column(
        children: [
          AuthButton(
            iconPath: Assets.images.auth0.path,
            label: 'Continue with Auth0',
            authButtonType: AuthButtonType.outlined,
            onPressed: () async {
              Auth0SocialService signInWithAuth0 = Auth0SocialService();
              final credentials = await signInWithAuth0.signIn();

              final user = credentials.user;
              final appUser = AppUser(
                id: user.sub,
                name: user.name ?? 'Anonymous User',
                email: user.email,
                profilePicture: user.pictureUrl.toString(),
              );
              AuthCubit.instance.login(
                appUser,
              );
            },
          ),
          const SizedBox(
            height: kPadding * 8,
          ),
          Text(
            'Built with ❤️ by Coders in Cubicles',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      );
}
