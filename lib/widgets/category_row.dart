import 'package:home_page/app_imports.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final category in CategoryData.categories)
          CategoryIcon(
            imagePath: category['image']!,
            label: category['label']!,
          ),
      ],
    );
  }
}
