import 'package:expiro/features/authentication/authentication.dart';
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
    @Default(false) bool isLoading,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);
}

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(const ProductState()) {
    fetchProducts();
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
      print(products.length);
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addProduct(ProductModel product) async {
    final user = AuthCubit.instance.state.user;
    if (user == null) return;
    emit(state.copyWith(isLoading: true));
    try {
      await _productRepository.addProduct(user.id, product);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  List<ProductModel?> getExpiredProducts() {
    final expiredProducts = state.products.map((e) {
      if (DateTime.parse(e.expiryDate).isAfter(DateTime.now())) {
        return e;
      }
    }).toList();
    return expiredProducts;
  }

  List<ProductModel?> getSoonToExpireProducts() {
    final soonToExpiredProducts = state.products.map((e) {
      if (DateTime.now()
          .add(const Duration(days: 15))
          .isAfter(DateTime.parse(e.expiryDate))) {
        return e;
      }
    }).toList();
    return soonToExpiredProducts;
  }

  List<ProductModel?> getGoodToUseProducts() {
    final goodToUseProducts = state.products.map((e) {
      if (DateTime.now()
          .add(const Duration(days: 15))
          .isBefore(DateTime.parse(e.expiryDate))) {
        return e;
      }
    }).toList();
    return goodToUseProducts;
  }
}
