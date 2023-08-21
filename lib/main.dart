import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json/productService.dart';
import 'package:json/product_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: const Center(child: Text("J S O N")),
            ),
            body: FutureBuilder(
                future: ProductService().getProduct(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            color: Colors.grey[50],
                            elevation: 3,
                            shadowColor: Colors.blueGrey,
                            child: ListTile(
                              onTap: () {
                                // Get.to(
                                //   ProductDetails(id: snapshot.data[index]["id"])
                                // );
                              },
                              leading: CircleAvatar(
                                child: Image.network(
                                    snapshot.data[index]['image']),
                              ),
                              subtitle: Text(snapshot.data[index]['title']),
                            ),
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
