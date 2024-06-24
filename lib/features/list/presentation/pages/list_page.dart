import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/product/data/blocs/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/data/models/product_model.dart';

@RoutePage()
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.products.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        } else {
          final productList = ((state.selectedCategory?.isEmpty ?? true) && state.expiresInFilter == null)
              ? state.products
              : state.filteredProducts;
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: _ProductCategoryFilters(
                  selectedCategory: state.selectedCategory,
                  onCategorySelected: (category) {
                    context.read<ProductCubit>().filterProductsByCategory(category);
                  },
                ),
              ),
              if (productList.isNotEmpty)
                Expanded(
                  flex: 17,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    padding: const EdgeInsets.all(kPadding),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return _ProductCard(
                        product: product,
                        onItemReduce: () {
                          context.read<ProductCubit>().tryReduceQuantity(product);
                        },
                        onPressed: () {
                          context.pushRoute(
                            ProductDetailsRoute(
                              product: product,
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              else
                Expanded(
                  flex: 17,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPadding * 20),
                    child: Column(
                      children: [
                        Icon(
                          Icons.remove_shopping_cart_outlined,
                          size: kPadding * 8,
                          color: theme.primaryColor,
                        ),
                        const SizedBox(height: kPadding * 3),
                        Text(
                          'No products found',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
      },
    );
  }
}

class _ProductCategoryFilters extends StatelessWidget {
  const _ProductCategoryFilters({required this.selectedCategory, required this.onCategorySelected});

  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.all(kPadding),
      itemCount: productCategoryList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final category = productCategoryList[index];
        final categoryIcon = productCategoryIconList[index];
        return GestureDetector(
          onTap: () {
            if (category == selectedCategory) {
              onCategorySelected(null);
              return;
            }
            onCategorySelected(category);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: category == selectedCategory ? theme.primaryColor : Colors.transparent,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(kPadding * 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2,
                vertical: kPadding * 2,
              ),
              child: Row(
                children: [
                  Icon(
                    categoryIcon,
                    color: category == selectedCategory ? theme.primaryColor : theme.colorScheme.onSurface,
                  ),
                  const SizedBox(width: kPadding),
                  Text(
                    category,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: category == selectedCategory ? theme.primaryColor : theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({Key? key, required this.product, required this.onItemReduce, required this.onPressed})
      : super(key: key);

  final ProductModel product;
  final VoidCallback onItemReduce;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final productImage = product.image;
    final theme = Theme.of(context);
    final quantity = product.quantity;
    final size = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPadding * 3),
        ),
        child: Stack(
          children: [
            if (productImage != null)
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: CachedNetworkImage(
                  imageUrl: productImage,
                  fit: BoxFit.cover,
                ),
              ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: onItemReduce,
                child: Container(
                  width: kPadding * 6,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(kPadding * 3),
                      topRight: Radius.circular(kPadding * 3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kPadding / 1.2),
                    child: Icon(
                      Icons.remove,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: size,
              height: 46,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      //Frosted glass effect
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: kPadding,
                      horizontal: kPadding * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${product.name} ${quantity > 1 ? "(${product.quantity})" : ""}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Container(
                              width: kPadding * 1.2,
                              height: kPadding * 1.2,
                              decoration: BoxDecoration(
                                color: product.expiryIndicatorColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: kPadding),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
