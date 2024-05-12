import 'package:expiro/features/app/presentation/statistics_card.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:expiro/features/home/data/blocs/explore_cubit.dart';
import 'package:expiro/features/home/data/repository/explore_repository.dart';
import 'package:expiro/features/home/home.dart';
import 'package:expiro/features/home/presentation/alerts_card.dart';
import 'package:expiro/features/product/data/blocs/product_cubit.dart';
import 'package:expiro/features/product/data/models/product_alerts_model.dart';
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
            BlocBuilder<ProductCubit, ProductState>(
              buildWhen: (previous, current) => previous.products.length != current.products.length,
              builder: (context, state) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding * 2,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: StatisticsCard(
                        title: 'Expiring Soon',
                        data: context.read<ProductCubit>().getSoonToExpireProducts().length.toString(),
                        color: const Color(0xffFFC107),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: kPadding / 2),
                    Expanded(
                      child: StatisticsCard(
                        title: 'Good to Use',
                        color: const Color(0xff4D9F6C),
                        textColor: Colors.white,
                        data: context.read<ProductCubit>().getGoodToUseProducts().length.toString(),
                      ),
                    ),
                    const SizedBox(width: kPadding / 2),
                    Expanded(
                      child: StatisticsCard(
                        title: 'Expired',
                        color: const Color(0xffE46962),
                        textColor: Colors.white,
                        data: context.read<ProductCubit>().getExpiredProducts().length.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _ContentHeading(
              title: 'Alerts',
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state.productAlerts.isEmpty) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: theme.primaryColor,
                        ),
                        const SizedBox(height: kPadding),
                        Text(
                          'No alerts found',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  padding: const EdgeInsets.symmetric(
                    vertical: kPadding * 2,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.productAlerts.length,
                    itemBuilder: (context, index) {
                      final alert = state.productAlerts[index];
                      return AlertsCard(
                        alertType: alert.alertType.value,
                        alertIcon: alert.alertIcon,
                        product: alert.name,
                        alertIconColor: alert.alertIconColor,
                        productUrl: alert.image ?? '',
                      );
                    },
                  ),
                );
              },
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
