import 'package:flutter/material.dart';
import 'package:home_page/models/product.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onFavorite;
  final Function(Product) onAddToCart;

  const ProductList({
    super.key,
    required this.products,
    required this.onFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final product in products)
          ProductCard(
            product: product,
            onFavorite: () => onFavorite(product),
            onAddToCart: () => onAddToCart(product),
          ),
      ],
    );
  }
}
