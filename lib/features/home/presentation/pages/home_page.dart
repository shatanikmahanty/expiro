import 'package:expiro/features/app/presentation/statistics_card.dart';
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
          ],
        ),
      ),
    );
  }
}
