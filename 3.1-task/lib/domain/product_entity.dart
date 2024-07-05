import 'package:check/domain/amount.dart';
import 'package:check/domain/category_type.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class ProductEntity extends StatelessWidget {
  final String title;
  final int price;
  final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  Decimal get decimalPrice => _getDecimalPrice(price);

  const ProductEntity({
    super.key,
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  Decimal _getDecimalPrice(int price) {
    final priceString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      amount.value.toString(),
                      style: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                    Text(
                      price.toString(),
                      style: const TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
