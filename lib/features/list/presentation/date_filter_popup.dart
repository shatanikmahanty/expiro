import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/product/data/blocs/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateFilterPopup extends StatelessWidget {
  const DateFilterPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();

    return PopupMenuButton(
        onSelected: (value) async {
          if (value == -1) {
            productCubit.filterProductsByExpiry(-1);
          } else if (value == 0) {
            final now = DateTime.now();
            final picked = await showDatePicker(
              context: context,
              firstDate: now.subtract(const Duration(days: daysInAYear * 15)),
              lastDate: now.add(const Duration(days: daysInAYear * 15)),
            );
            if (picked != null) {
              final expiresIn = picked.difference(now).inDays;
              productCubit.filterProductsByExpiry(expiresIn);
            }
          } else {
            productCubit.filterProductsByExpiry(value);
          }
        },
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('In a day'),
              ),
              const PopupMenuItem(
                value: 7,
                child: Text('In a week'),
              ),
              const PopupMenuItem(
                value: 14,
                child: Text('In 2 weeks'),
              ),
              const PopupMenuItem(
                value: 0,
                child: Text('Custom Expiry'),
              ),
              const PopupMenuItem(
                value: -1,
                child: Text('All'),
              ),
            ],
        child: const Icon(Icons.filter_list));
  }
}
