import 'dart:async';

import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'configurations/configurations.dart';
import 'expiro_app_builder.dart';
import 'firebase_options.dart';
import 'utils/utils.dart';

Future<void> main() async {
  // Runs the runApp method
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');
      // Dispatch exception to error reporters
      // ExeptionFilter.filter(exception); returns: true -> show exception to user or false -> do not show

      DjangoflowAppSnackbar.showError(
        ExceptionFormatter.format(exception),
      );
    },
    rootWidgetBuilder: (appBuilder) async {
      String? initialDeepLink;
      final appLinksRepository = AppLinksRepository();
      // await MongoRepository().init();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      if (!kIsWeb) {
        initialDeepLink = (await appLinksRepository.getInitialLink())?.path;
      }

      // initialize router
      final router = AppRouter();

      return appBuilder(
        ExpiroAppBuilder(
          appRouter: router,
          initialDeepLink: initialDeepLink,
          appLinksRepository: appLinksRepository,
        ),
      );
    },
  );
}
