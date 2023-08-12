import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlertsCard extends StatelessWidget {
  const AlertsCard(
      {super.key, required this.alertType, required this.alertIcon, required this.product, required this.productUrl});

  final String alertType;
  final String product;
  final String productUrl;
  final IconData alertIcon;


  @override
  Widget build(BuildContext context) => Card(
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: productUrl),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      alertType,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      alertIcon,
                      color: Colors.red,
                    ),
                  ],
                ),
                Text(
                  product,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
