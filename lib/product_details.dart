import 'package:flutter/material.dart';
import 'package:json/productService.dart';

class ProductDetails extends StatelessWidget {
   int id;
  ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
        ),
        body: FutureBuilder(
            future: ProductService().getSingleProduct(id),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data['image']);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
