import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_item.dart';
import '../widgets/procuct_summary_card.dart';
import '../widgets/category_selector.dart';

class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  String selectedCategory = "Semua";

  final List<Product> products = [
    Product(name: "Matcha Latte", price: 24000, image: "assets/matcha.png"),
    Product(name: "Boba Milk Tea", price: 22000, image: "assets/boba.png"),
    Product(name: "Cold Brew", price: 18000, image: "assets/coldbrew.png"),
    Product(name: "Lemonade", price: 10000, image: "assets/lemon.png"),
    Product(name: "Pancake", price: 25000, image: "assets/pancake.png"),
    Product(name: "Croissant", price: 25000, image: "assets/croissant.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd8b18a),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back, size: 26),
                  Text(
                    "Manajemen Produk",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.settings, size: 26),
                ],
              ),

              const SizedBox(height: 20),

             // SUMMARY CARD GROUP
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProductSummaryCard(
                          icon: Icons.inventory_2,
                          title: "Total produk",
                          value: "24",
                        ),
                        ProductSummaryCard(
                          icon: Icons.receipt_long,
                          title: "Order",
                          value: "700+",
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProductSummaryCard(
                          icon: Icons.warehouse,
                          title: "Total stok",
                          value: "1347",
                        ),
                        ProductSummaryCard(
                          icon: Icons.warning_amber,
                          title: "Stok menipis",
                          value: "7",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // CATEGORY SELECTOR
              CategorySelector(
                categories: const ["Semua", "Kopi", "Non-Kopi", "Camilan"],
                selected: selectedCategory,
                onSelected: (c) {
                  setState(() => selectedCategory = c);
                },
              ),

              const SizedBox(height: 20),

              // PRODUCT LIST
              Column(
                children: products
                    .map((product) => ProductItem(product: product))
                    .toList(),
              ),

              const SizedBox(height: 40),

              // ADD PRODUCT BUTTON
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Tambah produk",
                    style: TextStyle(color: Colors.white),
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
