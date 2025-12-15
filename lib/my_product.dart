import 'package:flutter/material.dart';
import 'api/api_product.dart';
import 'models/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = API().getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DANH SÁCH SẢN PHẨM",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Lỗi: ${snap.error}'));
          }
          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(child: Text('Không có sản phẩm'));
          }
          return ListView(children: snap.data!.map(myItem).toList());
        },
      ),
    );
  }

  Widget myItem(Product product) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${product.price}',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
