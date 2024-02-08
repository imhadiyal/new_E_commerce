import 'package:flutter/material.dart';
import 'package:new_e_commerce/view/components/category_product.dart';

import '../../utils/product_utils.dart';
import '../../utils/route_utils.dart';

Widget CategoryView({required String category, required BuildContext context}) {
  Size size = MediaQuery.sizeOf(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.replaceFirst(
            category[0],
            category[0].toUpperCase(),
          ),
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      CategoryProduct(category: category, context: context),
    ],
  );
}
