import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/models.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25.sp,
        vertical: 10.sp,
      ),
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: double.infinity,
      child: ItemBody(product),
    );
  }
}

class ItemBody extends StatelessWidget {
  const ItemBody(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductTitle(product: product),
        SizedBox(height: 20.sp),
        ProductDescription(product: product),
        SizedBox(height: 20.sp),
        ProductStock(product: product)
      ],
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.sp,
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              product.brand,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        // TODO: máscara de USD?
        Text(
          'USD${product.price}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
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
    return Text(
      product.description,
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 14.sp,
      ),
    );
  }
}

class ProductStock extends StatelessWidget {
  const ProductStock({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Stock: ${product.stock}'),
    );
  }
}
