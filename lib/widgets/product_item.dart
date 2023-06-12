import 'package:appsize/appsize.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/models.dart';
import 'package:flutter_challenge/theme/theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 10.sp,
      ),
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: myThemeLight.cardColor,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
    final priceMask = MoneyMaskedTextController(leftSymbol: 'USD');
    priceMask.updateValue(product.price.toDouble());

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
        Text(
          priceMask.text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
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
