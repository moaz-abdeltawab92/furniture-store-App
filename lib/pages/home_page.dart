import 'package:home_page/app_imports.dart';
import 'package:home_page/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onFavoriteToggle;
  final Function(Product) onAddToCart;
  const HomePage({
    super.key,
    required this.products,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryLight,
                  AppColors.primary,
                  AppColors.primaryDark,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const HomeHeader(),
          ),
          Positioned.fill(
            top: screenHeight * 0.29,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.borderRadius),
                  topRight: Radius.circular(AppConstants.borderRadius),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomSearchBar(),
                    const SizedBox(height: 24),
                    const CategoryRow(),
                    const SizedBox(height: 24),
                    ProductList(
                      products: products,
                      onFavorite: onFavoriteToggle,
                      onAddToCart: onAddToCart,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
