import 'package:appsize/appsize.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/theme/theme.dart';
import 'package:provider/provider.dart';

import 'package:flutter_challenge/models/product.dart';
import 'package:flutter_challenge/services/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ProductGallery(product: product),
            ProductDescription(product: product),
            ProductPrice(product: product),
          ],
        ),
        const AddButton(),
      ],
    );
  }
}

class ProductGallery extends StatefulWidget {
  const ProductGallery({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.product.images.length;
    return SizedBox(
      height: 300.sp,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return InteractiveViewer(
                  child: CachedNetworkImage(
                    imageUrl: widget.product.images[index],
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
              itemCount: itemCount,
            ),
          ),
          SizedBox(height: 10.sp),
          SmoothPageIndicator(
            controller: _controller,
            count: itemCount,
            effect: WormEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
              dotHeight: 10.sp,
              dotWidth: 10.sp,
            ),
          )
        ],
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 20.sp,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: product.category.toLowerCase(),
              style: myThemeLight.textTheme.headlineSmall,
            ),
            TextSpan(
              text: '\n${product.description}',
              style: myThemeLight.textTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
              ),
            ),
          ],
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

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.sp),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            myThemeLight.primaryColor,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
              vertical: 15.sp,
              horizontal: 40.sp,
            ),
          ),
        ),
        child: Text(
          'Agregar al carrito',
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
