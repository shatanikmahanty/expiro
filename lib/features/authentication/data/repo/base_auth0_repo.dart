import 'package:auth0_flutter/auth0_flutter.dart';

abstract class Auth0Service<T> {
  Auth0 auth0 = Auth0(
    'dev-katt2dm026s3d62b.us.auth0.com', //auth0 domain
    '1drVwmQ8njBIgldpHgXA7y3ijgCXqJ8m',
  );

  Future<T> signIn();

  Future<void> logOut();
}
