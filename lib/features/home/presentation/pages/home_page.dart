import 'package:expiro/features/app/presentation/statistics_card.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:expiro/features/home/data/blocs/explore_cubit.dart';
import 'package:expiro/features/home/data/repository/explore_repository.dart';
import 'package:expiro/features/home/home.dart';
import 'package:expiro/features/home/presentation/alerts_card.dart';
import 'package:expiro/features/product/data/blocs/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../configurations/configurations.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kPadding * 2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${context.watch<AuthCubit>().state.user?.name ?? "Guest!"}',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: kPadding * 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kPadding * 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: StatisticsCard(
                      title: 'Expiring Soon',
                      data: context.read<ProductCubit>().getSoonToExpireProducts().length.toString(),
                      color: const Color(0xffE46962),
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: kPadding / 2),
                  Expanded(
                    child: StatisticsCard(
                      title: 'Good to Use',
                      data: context.read<ProductCubit>().getGoodToUseProducts().length.toString(),
                    ),
                  ),
                  const SizedBox(width: kPadding / 2),
                  Expanded(
                    child: StatisticsCard(
                      title: 'Expired',
                      data: context.read<ProductCubit>().getExpiredProducts().length.toString(),
                    ),
                  ),
                ],
              ),
            ),
            const _ContentHeading(
              title: 'Alerts',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.symmetric(
                vertical: kPadding * 2,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  AlertsCard(
                    product: 'Fanta',
                    alertIcon: Icons.info,
                    alertType: 'Expiring Soon',
                    productUrl: 'https://assets.stickpng.com/images/580b57fbd9996e24bc43c10f.png',
                  ),
                  AlertsCard(
                    product: 'Fanta',
                    alertIcon: Icons.info,
                    alertType: 'Expiring Soon',
                    productUrl: 'https://assets.stickpng.com/images/580b57fbd9996e24bc43c10f.png',
                  ),
                ],
              ),
            ),
            const _ContentHeading(
              title: 'Explore',
            ),
            RepositoryProvider<ExploreRepository>(
              create: (context) => ExploreRepository(),
              child: BlocProvider<ExploreCubit>(
                create: (context) => ExploreCubit(
                  context.read<ExploreRepository>(),
                )..loadBlogs(),
                child: Builder(
                    builder: (context) => BlocBuilder<ExploreCubit, ExploreState>(
                          builder: (context, state) => state.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kPadding * 2,
                                  ),
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final blog = state.blogs[index];
                                      return ExploreCard(
                                        title: blog.title,
                                        subtitle: blog.subtitle,
                                        imageUrl: blog.image,
                                        onTap: () {
                                          launchUrlString(
                                            blog.launchUrl,
                                            mode: LaunchMode.externalApplication,
                                          );
                                        },
                                      );
                                    },
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.blogs.length,
                                  ),
                                ),
                        )),
              ),
            ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    );
  }
}

class _ContentHeading extends StatelessWidget {
  const _ContentHeading({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.primaryColor,
      ),
    );
  }
}
