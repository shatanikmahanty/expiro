import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:expiro/configurations/configurations.dart';

abstract class Auth0Service<T> {
  Auth0 auth0 = Auth0(
    kAuth0Domain, //auth0 domain
    kAuth0ClientId, //auth0 client id
  );

  Future<T> signIn();

  Future<void> logOut();
}
