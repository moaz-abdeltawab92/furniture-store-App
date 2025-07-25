import 'package:home_page/app_imports.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/favorite_products_page.dart';
import 'package:home_page/pages/profile_page.dart';
import 'package:home_page/data/dummy_products.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Product> products = List.from(dummyProducts);

  List<Product> cart = [];

  void _addToCart(Product product) {
    setState(() {
      if (!cart.contains(product)) {
        cart.add(product);
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
    });
  }

  void _toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = products.where((p) => p.isFavorite).toList();

    final List<Widget> _pages = [
      HomePage(
        products: products,
        onFavoriteToggle: _toggleFavorite,
        onAddToCart: _addToCart,
      ),
      CartPage(cart: cart, onRemoveFromCart: _removeFromCart),
      FavoriteProductsPage(
        favoriteProducts: favoriteProducts,
        onFavorite: _toggleFavorite,
      ),
      const ProfilePage(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Love',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
