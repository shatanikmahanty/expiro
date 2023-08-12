import 'package:expiro/features/app/presentation/statistics_card.dart';
import 'package:expiro/features/home/home.dart';
import 'package:expiro/features/home/presentation/alerts_card.dart';
import 'package:flutter/material.dart';

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
              'Hello Guest!',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: kPadding * 2),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: kPadding * 2,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: StatisticsCard(
                      title: 'Expiring Soon',
                      data: '2',
                      color: Color(0xffE46962),
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: kPadding / 2),
                  Expanded(
                    child: StatisticsCard(title: 'Good to Use', data: '5'),
                  ),
                  SizedBox(width: kPadding / 2),
                  Expanded(
                    child: StatisticsCard(title: 'Expired', data: '2'),
                  ),
                ],
              ),
            ),
            const _ContentHeading(
              title: 'Alerts',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
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
                    productUrl:
                        'https://assets.stickpng.com/images/580b57fbd9996e24bc43c10f.png',
                  ),
                  AlertsCard(
                    product: 'Fanta',
                    alertIcon: Icons.info,
                    alertType: 'Expiring Soon',
                    productUrl:
                        'https://assets.stickpng.com/images/580b57fbd9996e24bc43c10f.png',
                  ),
                ],
              ),
            ),
            const _ContentHeading(
              title: 'Explore',
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.symmetric(
                vertical: kPadding * 2,
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  ExploreCard(
                    title: 'How to recycle',
                    subtitle: 'by New York Times',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHJfFJQ8MYypeksy4QQU3kdSvyjZS53E-TdQ&usqp=CAU',
                  ),
                  ExploreCard(
                    title: 'How to recycle',
                    subtitle: 'by New York Times',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHJfFJQ8MYypeksy4QQU3kdSvyjZS53E-TdQ&usqp=CAU',
                  ),
                  ExploreCard(
                    title: 'How to recycle',
                    subtitle: 'by New York Times',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHJfFJQ8MYypeksy4QQU3kdSvyjZS53E-TdQ&usqp=CAU',
                  ),
                ],
              ),
            ),
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
