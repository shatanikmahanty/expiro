import 'package:expiro/features/authentication/authentication.dart';
import 'package:expiro/features/product/data/models/product_alerts_model.dart';
import 'package:expiro/features/product/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/product_repository.dart';

part 'product_cubit.freezed.dart';
part 'product_cubit.g.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<ProductModel> products,
    @Default([]) List<ProductAlertsModel> productAlerts,
    @Default([]) List<ProductModel> filteredProducts,
    @Default(false) bool isLoading,
    @Default(null) String? selectedCategory,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) => _$ProductStateFromJson(json);
}

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(const ProductState()) {
    fetchProducts();
  }

  void checkAlerts() {
    final productAlerts = <ProductAlertsModel>[];
    for (final product in state.products) {
      if (product.expiryDate.isBefore(DateTime.now())) {
        productAlerts.add(ProductAlertsModel(
          name: product.name,
          image: product.image,
          alertType: AlertType.expired,
        ));
      } else if (DateTime.now().add(const Duration(days: 3)).isAfter(product.expiryDate)) {
        productAlerts.add(ProductAlertsModel(
          name: product.name,
          image: product.image,
          alertType: AlertType.expiringSoon,
        ));
      }
    }
    emit(state.copyWith(productAlerts: productAlerts));
  }

  Future<void> fetchProducts() async {
    final user = AuthCubit.instance.state.user;
    if (user == null) return;
    emit(state.copyWith(isLoading: true));
    try {
      final products = await _productRepository.fetchProducts(user.id);
      emit(
        state.copyWith(
          isLoading: false,
          products: products,
        ),
      );
    } catch (e, _) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addProduct(ProductModel product) async {
    final user = AuthCubit.instance.state.user;
    if (user == null) return;
    emit(state.copyWith(isLoading: true));
    try {
      await _productRepository.addProduct(user.id, product);
      emit(
        state.copyWith(
          isLoading: false,
          products: [...state.products, product],
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  List<ProductModel?> getExpiredProducts() {
    final expiredProducts = state.products.where((e) => e.expiryDate.isBefore(DateTime.now())).toList();
    return expiredProducts;
  }

  List<ProductModel?> getSoonToExpireProducts() {
    final soonToExpiredProducts = state.products
        .where((e) => (e.expiryDate.difference(DateTime.now()).inDays <= 3 && e.expiryDate.isAfter(DateTime.now())))
        .toList();
    return soonToExpiredProducts;
  }

  List<ProductModel?> getGoodToUseProducts() {
    final goodToUseProducts =
        state.products.where((e) => e.expiryDate.isAfter(DateTime.now().add(const Duration(days: 3)))).toList();
    return goodToUseProducts;
  }

  Future<String?> uploadImage(String imagePath) async {
    final user = AuthCubit.instance.state.user;
    if (user == null) return null;
    try {
      final imageUrl = await _productRepository.uploadImage(user.id, imagePath);
      return imageUrl;
    } catch (e) {
      return null;
    }
  }

  void filterProductsByCategory(String? category) {
    if (category == null) {
      emit(state.copyWith(filteredProducts: [], selectedCategory: null));
      return;
    }
    final filteredProducts = state.products.where((element) => element.category == category).toList();
    emit(state.copyWith(filteredProducts: filteredProducts, selectedCategory: category));
  }
}
