import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:expiro/features/authentication/authentication.dart';
import 'package:expiro/features/product/data/blocs/product_cubit.dart';
import 'package:expiro/features/product/data/repository/product_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configurations/configurations.dart';
import 'features/app/presentation/builders/app_responsive_layout_builder.dart';

class ExpiroAppBuilder extends AppBuilder {
  ExpiroAppBuilder({
    super.key,
    super.onDispose,
    required AppRouter appRouter,
    required AppLinksRepository appLinksRepository,
    final String? initialDeepLink,
  }) : super(
          onInitState: (context) {},
          repositoryProviders: [
            RepositoryProvider<AppLinksRepository>.value(
              value: appLinksRepository,
            ),
            RepositoryProvider<ProductRepository>(
              create: (context) => ProductRepository(),
            ),
          ],
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit.instance,
            ),
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit.instance,
            ),
            BlocProvider<AppLinksCubit>(
              create: (context) => AppLinksCubit(
                null,
                context.read<AppLinksRepository>(),
              ),
              lazy: false,
            ),
            BlocProvider<ProductCubit>(
              create: (context) => ProductCubit(
                context.read<ProductRepository>(),
              ),
            ),
          ],
          builder: (context) => AppCubitConsumer(
            listenWhen: (previous, current) =>
                previous.environment != current.environment,
            listener: (context, state) async {},
            builder: (context, appState) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              scaffoldMessengerKey: DjangoflowAppSnackbar.scaffoldMessengerKey,
              title: kAppTitle,
              routeInformationParser: RouteParser(
                appRouter.matcher,
                includePrefixMatches: true,
              ),
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: appState.themeMode,
              locale: Locale(appState.locale, ''),
              supportedLocales: const [
                Locale('en', ''),
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerDelegate: appRouter.delegate(
                deepLinkBuilder: (_) => initialDeepLink != null
                    ? DeepLink.path(initialDeepLink)
                    : DeepLink(
                        [
                          AppHomeRoute(),
                        ],
                      ),
                // List of global navigation obsersers here
                // SentryNavigationObserver
                // navigatorObservers: () => {RouteObserver()},
              ),
              builder: (context, child) => AppResponsiveLayoutBuilder(
                child: SandboxBanner(
                  isSandbox: appState.environment == AppEnvironment.sandbox,
                  child: child != null
                      ? kIsWeb
                          ? child
                          : AppLinksCubitListener(
                              listenWhen: (previous, current) =>
                                  current != null,
                              listener: (context, appLink) {
                                final path = appLink?.path;
                                if (path != null) {
                                  appRouter.navigateNamed(
                                    path,
                                    onFailure: (failure) {
                                      appRouter.navigate(
                                        AppHomeRoute(),
                                      );
                                    },
                                  );
                                }
                              },
                              child: child,
                            )
                      : const Offstage(),
                ),
              ),
            ),
          ),
        );
}
