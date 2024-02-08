import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_e_commerce/utils/product_utils.dart';
import 'package:new_e_commerce/view/components/category_view.dart';

import '../../utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyRoutes.cartPage);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
                Icons.shopping_cart,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://www.nicepng.com/png/full/182-1829287_cammy-lin-ux-designer-circle-picture-profile-girl.png",
                  ),
                ),
                accountName: Text("Darshana Hadiyal"),
                accountEmail: Text("darshanhadiyal2003@gmail.com"),
              ),
              ...allCategories
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        log("CAT: $e");
                        Navigator.pop(context);
                        selectedCategory = e;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                ImageList[allCategories.indexOf(e)]),
                          ),
                          Container(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.replaceFirst(
                                e[0],
                                e[0].toUpperCase(),
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.20,
              width: size.width * 10,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: selectedCategory != null,
                      child: ActionChip(
                        onPressed: () {
                          setState(() {
                            selectedCategory = null;
                          });
                        },
                        avatar: const Icon(Icons.clear),
                        label: const Text("Clear filter"),
                      ),
                    ),
                    ...allCategories
                        .map(
                          (e) => selectedCategory == null
                              ? CategoryView(category: e, context: context)
                              : selectedCategory == e
                                  ? CategoryView(category: e, context: context)
                                  : Container(),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
