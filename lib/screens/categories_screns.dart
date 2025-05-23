import 'package:flutter/material.dart';
import '../app_data.dart';
import '../wedgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map(
        (categoryData) {
          return CategoryItem(
            id: categoryData.id, // تأكد من تمرير "id"
            title: categoryData.title, // تأكد من تمرير "title"
            imageUrl: categoryData.imageUrl, // تأكد من تمرير "imageUrl"
          );
        },
      ).toList(),
    );
  }
}
