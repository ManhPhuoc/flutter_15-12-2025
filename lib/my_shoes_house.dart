import 'package:flutter/material.dart';
import 'package:list_view/api/api.dart';
import 'package:list_view/models/list_product.dart';

class MyShoesHouse extends StatefulWidget {
  const MyShoesHouse({super.key});

  @override
  State<MyShoesHouse> createState() => _MyShoesHouseState();
}

class _MyShoesHouseState extends State<MyShoesHouse> {
  late Api api;
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    // Khởi tạo API và bắt đầu tải dữ liệu
    api = Api();
    futureProducts = api.getAllShoes();
  }

  @override
  Widget build(BuildContext context) {
    // 💡 1. Tính toán số cột (Responsive Design)
    final screenWidth = MediaQuery.of(context).size.width;
    // Đặt chiều rộng tối thiểu cho mỗi cột là 160px
    final crossAxisCount = (screenWidth / 160).floor().clamp(2, 4);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DANH SÁCH SẢN PHẨM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        elevation: 4,
      ),
      body: Container(
        color: const Color(0xFFFAF9FB), // Màu nền nhẹ
        child: FutureBuilder<List<Product>>(
          future: futureProducts,
          builder: (context, snap) {
            // 1. Trạng thái Hoàn thành
            if (snap.connectionState == ConnectionState.done) {
              if (snap.hasError) {
                return Center(child: Text('Lỗi tải dữ liệu: ${snap.error}'));
              }
              // Kiểm tra dữ liệu rỗng
              if (snap.data?.isEmpty ?? true) {
                return const Center(child: Text('Không tìm thấy sản phẩm.'));
              }
              // 💡 2. Thay thế myListView bằng myGridView
              return myGridView(snap.data!, crossAxisCount);
            }
            // 2. Trạng thái Đang tải
            else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.blueGrey),
              );
            }
          },
        ),
      ),
    );
  }

  // 💡 HÀM MỚI: Xây dựng GridView
  Widget myGridView(List<Product> list, int crossAxisCount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Sử dụng số cột đã tính
          childAspectRatio:
              0.65, // Tỉ lệ chiều rộng/chiều cao (0.65 làm cho item cao hơn, phù hợp với Card)
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return myGridItem(list[index]); // Gọi hàm myGridItem
        },
      ),
    );
  }

  // 💡 HÀM MỚI: Xây dựng mỗi Item sản phẩm trong lưới (đã được tối ưu cho bố cục cột)
  Widget myGridItem(Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Kéo dãn theo chiều ngang
          children: [
            // Ảnh (Chiếm phần lớn không gian)
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Chi tiết (Text)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tiêu đề
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Giá
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Xếp hạng
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating.rate.toStringAsFixed(1)} (${product.rating.count})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // // Nút "Xem Chi Tiết"
                  // Center(
                  //   child: SizedBox(
                  //     height: 28,
                  //     child: OutlinedButton(
                  //       onPressed: () {
                  //         // Logic mở trang chi tiết
                  //       },
                  //       style: OutlinedButton.styleFrom(
                  //         side: const BorderSide(
                  //           color: Colors.blueGrey,
                  //           width: 1,
                  //         ),
                  //         padding: const EdgeInsets.symmetric(horizontal: 8),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         'Chi tiết',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.blueGrey,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
