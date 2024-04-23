import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:new_e_commerce/utils/product_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var totalPrice;

  @override
  void initState() {
    super.initState();
    totaltems = Cart.map((e) => 1).toList();
  }

  void calculatPrice() {
    totalPrice = 0;
    cartItems.forEach((element) {
      totalPrice += (element['price'] * element['qty']);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double? avg;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CartPage"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...Cart.map(
                    (e) => Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: double.infinity,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: double.infinity,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(e['thumbnail']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['title'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\$${(e['price'] - (e['price'] * e['discountPercentage'] / 100)).toString().split('.')[0]}.${(e['price'] - (e['price'] * e['discountPercentage'] / 100)).toString().split('.')[1][0]}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (totaltems[Cart.indexOf(e)] >
                                                  0) {
                                                totaltems[Cart.indexOf(e)]--;
                                                setState(() {});
                                              } else {}
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          Text("${totaltems[Cart.indexOf(e)]}"),
                                          IconButton(
                                            onPressed: () {
                                              totaltems[Cart.indexOf(e)]++;
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Cart.remove(e);
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.delete),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(totalPrice.toString()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
