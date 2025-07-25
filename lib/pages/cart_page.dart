import 'package:home_page/app_imports.dart';

class CartPage extends StatelessWidget {
  final List<Product> cart;
  final Function(Product) onRemoveFromCart;
  const CartPage(
      {super.key, required this.cart, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cart.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  leading: Image.asset(product.image, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle: Text(product.desc),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\u000024${product.price}'),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => onRemoveFromCart(product),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
