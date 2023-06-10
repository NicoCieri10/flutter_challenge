import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  static const name = 'product';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ProductPage'),
      ),
    );
  }
}
