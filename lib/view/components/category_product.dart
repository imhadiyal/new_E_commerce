import 'package:flutter/material.dart';

import '../../utils/product_utils.dart';
import '../../utils/route_utils.dart';

Widget CategoryProduct({
  required String category,
  required BuildContext context,
}) {
  Size size = MediaQuery.sizeOf(context);
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...allProducts
            .map((element) => (element['category'] == category)
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MyRoutes.detailPage, arguments: element);
                    },
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.5,
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(element['thumbnail']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: size.height * 0.1,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  element['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  element['description'],
                                  maxLines: 1,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\$ ${element['price']} /-".toString(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container())
            .toList()
      ],
    ),
  );
}
