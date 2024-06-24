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
    @Default(null) int? expiresInFilter,
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

  Future<void> removeProduct(ProductModel product) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _productRepository.removeProduct(product.id);
      final updatedProducts = state.products.where((e) => e.id != product.id).toList();
      emit(
        state.copyWith(
          isLoading: false,
          products: updatedProducts,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  ///Tries to reduce the quantity of a product
  ///If the quantity is 1, the product is removed
  Future<void> tryReduceQuantity(ProductModel product) async {
    // emit(state.copyWith(isLoading: true));
    final productQuantity = product.quantity;

    //Handle deletion
    if (productQuantity == 1) {
      removeProduct(product);
      return;
    }

    //Handle quantity reduction
    product = product.copyWith(
      quantity: product.quantity - 1,
    );
    try {
      await _productRepository.setQuantity(product.id, product.quantity);
      final updatedProducts = state.products.map((e) {
        if (e.id == product.id) {
          return product;
        }
        return e;
      }).toList();
      emit(
        state.copyWith(
          isLoading: false,
          products: updatedProducts,
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
      emit(state.copyWith(
        filteredProducts: [],
        selectedCategory: null,
        expiresInFilter: null,
      ));
      return;
    }
    final filteredProducts = state.products.where((element) => element.category == category).toList();
    emit(state.copyWith(filteredProducts: filteredProducts, selectedCategory: category));
  }

  void filterProductsByExpiry(int i) {
    if (i == -1) {
      emit(state.copyWith(
        filteredProducts: [],
        selectedCategory: null,
        expiresInFilter: null,
      ));
      return;
    }
    final listForFilter = state.selectedCategory == null ? state.products : state.filteredProducts;
    final filteredProducts = listForFilter.where((element) {
      final diff = element.expiryDate.difference(DateTime.now()).inDays;
      return diff <= i;
    }).toList();
    emit(state.copyWith(filteredProducts: filteredProducts, expiresInFilter: i));
  }
}
