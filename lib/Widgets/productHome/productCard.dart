import 'package:flutter/material.dart';
import 'package:prm393_project/Widgets/productHome/discountBadge.dart';
import 'package:prm393_project/Widgets/productHome/productColors.dart';
import 'package:prm393_project/Widgets/productHome/productPriceRow.dart';
import 'package:prm393_project/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({required this.product, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ProductColors.card,
      elevation: 1.5,
      shadowColor: Colors.black26,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  _ProductThumbnail(image: product.image),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ProductColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ProductPriceRow(
                          price: product.price,
                          discountPercent: product.discountPercent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if ((product.discountPercent ?? 0) > 0)
              Positioned(
                top: 8,
                right: 8,
                child: DiscountBadge(percent: product.discountPercent!),
              ),
          ],
        ),
      ),
    );
  }
}

class _ProductThumbnail extends StatelessWidget {
  final String? image;

  const _ProductThumbnail({this.image});

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      color: ProductColors.background,
      child: const Icon(Icons.image_outlined, color: ProductColors.oldPrice),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 72,
        height: 72,
        child: (image == null || image!.isEmpty)
            ? placeholder
            : Image.asset(
                image!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => placeholder,
              ),
      ),
    );
  }
}
