import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) => const ExpiroScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
        appBarTitleText: 'List',
        centerAppBarTitle: true,
      );
}
