import 'package:expiro/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/blocs/home_cubit.dart';

class AdvisoryCard extends StatelessWidget {
  const AdvisoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: kPadding / 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2,
          vertical: kPadding * 3,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Advisory: ',
                  style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    context.watch<HomeCubit>().state.advisory ?? '',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kPadding * 2,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) => SizedBox(
                height: kPadding * 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kPadding / 2,
                    ),
                    child: Chip(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kPadding * 4),
                      ),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      label: Text(
                        state.diseases[index],
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  itemCount: state.diseases.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
