import 'package:api_products/providers/Product_Provider.dart';
import 'package:flutter/material.dart';
import '../models/modelProducts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final productprovider = ProductProvider();
  late Future<List<ModelosProducts>> _listadoProducts;

  @override
  void initState() {
    super.initState();
    _listadoProducts = productprovider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            'Fake Store API',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Aplicar negrita al texto
            ),
          ),
          centerTitle: true, // Centrar el título horizontalmente
        ),
        body: FutureBuilder(
          future: _listadoProducts,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Error"),
              );
            } else if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                children: _listProducts(snapshot.data!),
              );
            }

            return Container();
          }),
        ),
      ),
    );
  }

  List<Widget> _listProducts(List<ModelosProducts> data) {
    return data
        .map((product) => Card(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      product.url,
                      fit: BoxFit.cover, // Hacer la imagen responsiva
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          product.title,
                        ),
                        Text('Price: \$${product.price}'),
                        Text(product.description),
                        Text(product.category),
                        Text(
                            'Rating: ${product.rating.rate} (${product.rating.count} reviews)'),
                      ],
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
