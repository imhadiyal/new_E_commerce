import 'package:flutter/material.dart';
import 'package:new_e_commerce/utils/route_utils.dart';
import 'package:new_e_commerce/view/screens/cart_page.dart';
import 'package:new_e_commerce/view/screens/details_page.dart';
import 'package:new_e_commerce/view/screens/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
