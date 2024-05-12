// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:expiro/features/app/presentation/pages/app_home_page.dart'
    deferred as _i2;
import 'package:expiro/features/app/presentation/pages/unknown_page.dart'
    deferred as _i12;
import 'package:expiro/features/authentication/presentation/pages/login_options_router_page.dart'
    deferred as _i5;
import 'package:expiro/features/authentication/presentation/pages/login_providers_page.dart'
    deferred as _i6;
import 'package:expiro/features/authentication/presentation/pages/login_router_page.dart'
    deferred as _i7;
import 'package:expiro/features/authentication/presentation/pages/onboarding_page.dart'
    deferred as _i8;
import 'package:expiro/features/home/presentation/pages/home_page.dart'
    deferred as _i3;
import 'package:expiro/features/list/presentation/pages/list_page.dart'
    deferred as _i4;
import 'package:expiro/features/product/data/models/product_model.dart' as _i15;
import 'package:expiro/features/product/presentation/pages/add_product_page.dart'
    deferred as _i1;
import 'package:expiro/features/product/presentation/pages/product_details_page.dart'
    deferred as _i9;
import 'package:expiro/features/product/presentation/pages/product_router_page.dart'
    deferred as _i10;
import 'package:expiro/features/profile/presentation/pages/profile_page.dart'
    deferred as _i11;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddProductRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AddProductPage(),
        ),
      );
    },
    AppHomeRoute.name: (routeData) {
      final args = routeData.argsAs<AppHomeRouteArgs>(
          orElse: () => const AppHomeRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i2.loadLibrary,
          () => _i13.WrappedRoute(child: _i2.AppHomePage(key: args.key)),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.HomePage(),
        ),
      );
    },
    ListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.ListPage(),
        ),
      );
    },
    LoginOptionsRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.LoginOptionsRouterPage(),
        ),
      );
    },
    LoginProvidersRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.LoginProvidersPage(),
        ),
      );
    },
    LoginRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.LoginRouterPage(),
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.OnboardingPage(key: args.key),
        ),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.ProductDetailsPage(
            key: args.key,
            product: args.product,
          ),
        ),
      );
    },
    ProductRouter.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.ProductRouterPage(),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i11.loadLibrary,
          () => _i11.ProfilePage(),
        ),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.DeferredWidget(
          _i12.loadLibrary,
          () => _i12.UnknownPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddProductPage]
class AddProductRoute extends _i13.PageRouteInfo<void> {
  const AddProductRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AppHomePage]
class AppHomeRoute extends _i13.PageRouteInfo<AppHomeRouteArgs> {
  AppHomeRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AppHomeRoute.name,
          args: AppHomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AppHomeRoute';

  static const _i13.PageInfo<AppHomeRouteArgs> page =
      _i13.PageInfo<AppHomeRouteArgs>(name);
}

class AppHomeRouteArgs {
  const AppHomeRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'AppHomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ListPage]
class ListRoute extends _i13.PageRouteInfo<void> {
  const ListRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginOptionsRouterPage]
class LoginOptionsRouter extends _i13.PageRouteInfo<void> {
  const LoginOptionsRouter({List<_i13.PageRouteInfo>? children})
      : super(
          LoginOptionsRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginOptionsRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginProvidersPage]
class LoginProvidersRoute extends _i13.PageRouteInfo<void> {
  const LoginProvidersRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginProvidersRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginProvidersRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginRouterPage]
class LoginRouter extends _i13.PageRouteInfo<void> {
  const LoginRouter({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRouter.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<OnboardingRouteArgs> page =
      _i13.PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProductDetailsPage]
class ProductDetailsRoute extends _i13.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i14.Key? key,
    required _i15.ProductModel product,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const _i13.PageInfo<ProductDetailsRouteArgs> page =
      _i13.PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.product,
  });

  final _i14.Key? key;

  final _i15.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i10.ProductRouterPage]
class ProductRouter extends _i13.PageRouteInfo<void> {
  const ProductRouter({List<_i13.PageRouteInfo>? children})
      : super(
          ProductRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProductRouter';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.UnknownPage]
class UnknownRoute extends _i13.PageRouteInfo<void> {
  const UnknownRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UnknownRoute.name,
          initialChildren: children,
        );

  static const String name = 'UnknownRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
