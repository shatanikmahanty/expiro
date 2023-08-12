import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:expiro/features/authentication/data/repo/base_auth0_repo.dart';
import 'package:flutter/foundation.dart';

class Auth0SocialService extends Auth0Service<Credentials> {
  @override
  Future<Credentials> signIn() async {
    try {
      Credentials response = await auth0
          .webAuthentication(
            scheme: 'demo',
          )
          .login();

      if (kDebugMode) {
        print(response.accessToken);
      }
      return response;
    } catch (e) {
      if (!kReleaseMode) {
        debugPrint(e.toString());
      }
      if (e.toString().contains(
          'The user closed the browser app and the authentication was canceled')) {
        throw Exception('User cancelled the logout');
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<void> logOut() async {
    await auth0.webAuthentication(scheme: 'demo').logout();
  }
}
