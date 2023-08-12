import 'package:flutter/material.dart';

import '../../../../configurations/configurations.dart';
import '../../../app/app.dart';

@RoutePage()
class AppHomePage extends StatelessWidget with AutoRouteWrapper {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          ListRoute(),
          ProfileRoute(),
        ],
        transitionBuilder: (context, child, animation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          if ((context.tabsRouter.previousIndex ?? 0) <
              context.tabsRouter.activeIndex) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: begin, end: end).chain(
                  CurveTween(
                    curve: curve,
                  ),
                ),
              ),
              child: child,
            );
          } else {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: -begin, end: -end).chain(
                  CurveTween(curve: curve),
                ),
              ),
              child: child,
            );
          }
        },
        animationCurve: Curves.easeInOut,
        resizeToAvoidBottomInset: false,
        appBarBuilder: (context, tabsRouter) => ExpiroAppBar(
          centerTitle: true,
          appBarTitleText: getAppBarText(tabsRouter.activeIndex),
        ),
        bottomNavigationBuilder: (context, tabsRouter) => SafeArea(
          bottom: true,
          child: SizedBox(
            child: BottomNavigationBar(
              onTap: (value) => tabsRouter.setActiveIndex(value),
              currentIndex: tabsRouter.activeIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined),
                  activeIcon: Icon(Icons.list_outlined),
                  label: 'Lists',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget wrappedRoute(BuildContext context) => this;

  String getAppBarText(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return kAppBarTitle;
      case 1:
        return 'Lists';
      case 2:
        return 'Profile';
      default:
        return 'Not Found';
    }
  }
}
