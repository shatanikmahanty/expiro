import 'package:cached_network_image/cached_network_image.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configurations/configurations.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        final theme = Theme.of(context);

        return Column(
          children: [
            CachedNetworkImage(
              imageUrl: state.user?.profilePicture ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: kPadding * 25,
                height: kPadding * 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(
                Icons.person,
              ),
            ),
            const SizedBox(
              height: kPadding * 4,
            ),
            Text(
              state.user?.name ?? '',
              style: theme.textTheme.displaySmall?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        );
      });
}
