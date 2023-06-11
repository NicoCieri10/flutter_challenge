import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_challenge/models/models.dart';
import 'package:flutter_challenge/services/services.dart';
import 'package:flutter_challenge/theme/theme.dart';
import 'package:flutter_challenge/views/views.dart';
import 'package:flutter_challenge/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final List<Product> products = productsService.products;

    if (productsService.isLoading) return const LoadingPage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Challenge 2023'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.sp,
          ),
          child: HomeView(products),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView(this.products, {super.key});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        SizedBox(height: 10.sp),
        ProductsList(products),
      ],
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList(this.products, {super.key});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = products[index];
            context.pushNamed('product');
          },
          child: ProductItem(
            products[index],
          ),
        ),
        itemCount: products.length,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    final focusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(
        color: myThemeLight.primaryColor,
      ),
    );

    return SizedBox(
      height: 50.sp,
      width: 300.sp,
      child: TextField(
        onChanged: (value) {},
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Buscar producto',
          hintStyle: TextStyle(fontSize: 14.sp),
          prefixIcon: Icon(
            Icons.search,
            size: 25.sp,
            color: myThemeLight.primaryColor,
          ),
          focusedBorder: focusedBorderStyle,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.sp),
            borderRadius: BorderRadius.all(
              Radius.circular(8.sp),
            ),
          ),
        ),
      ),
    );
  }
}
