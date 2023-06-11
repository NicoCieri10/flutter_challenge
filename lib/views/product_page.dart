import 'package:appsize/appsize.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_challenge/models/product.dart';
import 'package:flutter_challenge/services/services.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  static const name = 'product';

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final product = productsService.selectedProduct;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: ProductView(product: product),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductGallery(product: product),
        SizedBox(height: 10.sp),
        ProductDescription(product: product),
        SizedBox(height: 30.sp),
        ProductPrice(product: product)
      ],
    );
  }
}

class ProductGallery extends StatelessWidget {
  const ProductGallery({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.sp,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(product.images[index]);
        },
        itemCount: product.images.length,
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 20.sp,
      ),
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        product.description,
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final priceMask = MoneyMaskedTextController(leftSymbol: 'USD');
    priceMask.updateValue(product.price.toDouble());

    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: 20.sp,
      ),
      child: Text(
        priceMask.text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
