import '../../../../configurations/configurations.dart';

final productRoutes = [
  AutoRoute(
    initial: true,
    path: 'add-product',
    page: AddProductRoute.page,
  ),
  AutoRoute(
    path: 'product-description',
    page: ProductDetailsRoute.page,
  ),
];
