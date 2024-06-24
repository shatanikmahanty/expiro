import 'package:cached_network_image/cached_network_image.dart';
import 'package:expiro/configurations/configurations.dart';
import 'package:expiro/features/app/app.dart';
import 'package:expiro/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = widget.product;
    final daysTillExpiry = product.daysTillExpiry;
    final dateFormat = DateFormat('dd MMM yyyy');
    return ExpiroScaffold(
      appBarTitleText: 'Product Description',
      centerAppBarTitle: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.image ?? '',
                      height: kPadding * 25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: kPadding * 2,
                      left: kPadding * 2,
                      child: _ProductLabel(
                        label: product.category ?? '',
                        icon: Icons.category,
                        backgroundColor: theme.colorScheme.surface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kPadding * 2),
              Card(
                elevation: kPadding / 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kPadding * 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding * 2),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: theme.textTheme.headlineSmall,
                              ),
                              const SizedBox(height: kPadding),
                              _ProductLabel(label: product.isRecyclableStr ?? 'Non-Recyclable', icon: Icons.eco)
                            ],
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox.square(
                                dimension: kPadding * 10,
                                child: CircularProgressIndicator(
                                  value: daysTillExpiry < 0 ? 1 : daysTillExpiry / 7,
                                  color: product.expiryIndicatorColor,
                                ),
                              ),
                              Text(
                                '${daysTillExpiry < 0 ? 0 : daysTillExpiry}\ndays',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: kPadding * 2),
                      Row(
                        children: [
                          _ProductInfo(
                            label: 'Quantity',
                            info: product.quantity.toString(),
                            color: theme.primaryColor,
                          ),
                          const SizedBox(
                            width: kPadding * 2,
                          ),
                          _ProductInfo(
                            label: 'Storage Location',
                            info: product.storageInstructions ?? 'Not Specified',
                            color: theme.primaryColor,
                          ),
                          const SizedBox(
                            width: kPadding * 2,
                          ),
                          _ProductInfo(
                            label: 'Expiry Date',
                            info: dateFormat.format(product.expiryDate),
                            color: product.expiryIndicatorColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductLabel extends StatelessWidget {
  const _ProductLabel({required this.label, required this.icon, this.backgroundColor});

  final String label;
  final IconData icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kPadding / 2, horizontal: kPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding),
        color: backgroundColor,
        border: Border.all(
          color: theme.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: theme.primaryColor,
          ),
          const SizedBox(width: kPadding / 2),
          Text(label),
        ],
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.label, required this.color, required this.info});

  final String label;
  final String info;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          info,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
