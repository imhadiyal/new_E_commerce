import 'package:flutter/material.dart';
import 'package:new_e_commerce/utils/product_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
// modelRoute.of(context) ?.setting.arguments as Map ?) ?? allProduct[0];

class _DetailPageState extends State<DetailPage> {
  double price = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(data['title']),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  data['images'].length,
                  (index) => Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(data['images'][index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 10, offset: Offset(3, 3))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            //DetailsCard
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data['description'],
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${(data['price'].toString())}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "    \$${(data['price'] - (data['price'] * data['discountPercentage'] / 100)).toString().split('.')[0]}.${(data['price'] - (data['price'] * data['discountPercentage'] / 100)).toString().split('.')[1][0]}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!Cart.contains(data)) {
            Cart.add(data);
          }
        },
        label: const Text('Add to cart'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
