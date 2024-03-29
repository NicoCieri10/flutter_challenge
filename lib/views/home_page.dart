import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/providers/providers.dart';
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

    if (productsService.isLoading) return const LoadingPage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Challenge 2023'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await productsService.loadProducts();
        },
        color: myThemeLight.primaryColor,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ChangeNotifierProvider(
            create: (_) => HomePageProvider(),
            child: const HomeView(),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final homeProvider = Provider.of<HomePageProvider>(context);

    List<Product> products = productsService.products;

    products = products.where((product) {
      return product.title
          .toLowerCase()
          .contains(homeProvider.search.toLowerCase());
    }).toList();

    return Column(
      children: [
        SizedBox(height: 20.sp),
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
    final homeProvider = Provider.of<HomePageProvider>(context);

    return Expanded(
      child: products.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Text(
                'No se encontraron resultados para ${homeProvider.search}',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  productsService.selectedProduct = products[index];
                  context.pushNamed('product');
                },
                child: ProductItem(
                  products[index],
                ),
              ),
              // clipBehavior: Clip.none,
              itemCount: products.length,
            ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomePageProvider>(context);

    final focusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sp),
      borderSide: BorderSide(
        color: myThemeLight.primaryColor,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      height: 50.sp,
      child: TextField(
        onChanged: (value) {
          homeProvider.search = value;
        },
        controller: homeProvider.searchEditingController(),
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
