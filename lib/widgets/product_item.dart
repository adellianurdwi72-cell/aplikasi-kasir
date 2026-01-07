import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfff7e9d9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            product.image,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),

          // NAME + PRICE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Rp. ${product.price}",
                style: const TextStyle(color: Colors.brown),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
