import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../../configurations/configurations.dart';
import '../../../app/app.dart';

@RoutePage()
class AppHomePage extends StatelessWidget with AutoRouteWrapper {
  AppHomePage({
    Key? key,
  }) : super(key: key);

  final expandableKey = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ListRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.fastOutSlowIn;

        if ((context.tabsRouter.previousIndex ?? 0) < context.tabsRouter.activeIndex) {
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButtonBuilder: (context, router) => router.activeIndex == 0
          ? ExpandableFab(
              key: expandableKey,
              openButtonBuilder: RotateFloatingActionButtonBuilder(
                child: const Icon(Icons.add),
                fabSize: ExpandableFabSize.regular,
                backgroundColor: theme.primaryColor,
                heroTag: null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kButtonRadius * 2),
                ),
              ),
              closeButtonBuilder: DefaultFloatingActionButtonBuilder(
                child: const Icon(Icons.close),
                fabSize: ExpandableFabSize.small,
                heroTag: null,
                backgroundColor: theme.primaryColor,
              ),
              overlayStyle: ExpandableFabOverlayStyle(
                // color: Colors.black.withOpacity(0.5),
                blur: 5,
              ),
              children: [
                FloatingActionButton(
                  heroTag: null,
                  tooltip: 'Add Manually',
                  onPressed: () {
                    expandableKey.currentState?.toggle();
                    context.router.push(const ProductRouter());
                  },
                  child: const Icon(Icons.edit),
                ),
                FloatingActionButton(
                  heroTag: null,
                  tooltip: 'Scan QR Code',
                  onPressed: () async {
                    expandableKey.currentState?.toggle();
                    final result = await BarcodeScanner.scan();
                    print('result -------------------> ${result.rawContent}');
                  },
                  child: const Icon(
                    Icons.qr_code_scanner,
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  tooltip: 'Add Image',
                  onPressed: () {
                    expandableKey.currentState?.toggle();
                  },
                  child: const Icon(
                    Icons.image,
                  ),
                ),
              ],
            )
          : const Offstage(),
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
  }

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
