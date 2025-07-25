import 'package:flutter/material.dart';
import 'package:home_page/models/product.dart';
import 'package:home_page/widgets/product_list.dart';

class FavoriteProductsPage extends StatelessWidget {
  final List<Product> favoriteProducts;
  final Function(Product) onFavorite;

  const FavoriteProductsPage({
    super.key,
    required this.favoriteProducts,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ProductList(
        products: favoriteProducts,
        onFavorite: onFavorite,
        onAddToCart: (Product) {},
      ),
    );
  }
}
