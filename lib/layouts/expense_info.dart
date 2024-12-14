import 'package:flutter/material.dart';
import 'package:money/modal/item.dart'; // Import DataItem nếu bạn đang sử dụng kiểu dữ liệu này.

class ExpenseInfo extends StatelessWidget {
  final DataItem item; // Đảm bảo kiểu dữ liệu là DataItem

  // Constructor nhận đối số item
  ExpenseInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Khoảng cách dưới mỗi item
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh dọc trên cùng
              children: [
                // Hiển thị tên item kèm icon
                Expanded(
                  flex: 2, // Điều chỉnh tỷ lệ giữa các phần tử
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart, // Icon đại diện cho item
                        size: 40,
                        color: Colors.teal,
                      ),
                      Expanded(
                        child: Text(
                          item.item, // Hiển thị tên item
                          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis, // Thêm dấu "..." nếu quá dài
                        ),
                      ),
                      const SizedBox(width: 8), // Tạo khoảng cách với icon
                    ],
                  ),
                ),
                // Hiển thị thông tin ngân hàng và giá
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end, // Căn phải
                    children: [
                      // Hiển thị tên ngân hàng kèm icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Đảm bảo icon căn phải
                        children: [
                          Text(
                            item.bank, // Hiển thị tên ngân hàng
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 8), // Tạo khoảng cách với icon
                          const Icon(
                            Icons.account_balance, // Icon đại diện cho ngân hàng
                            size: 15,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Hiển thị giá trị và đơn vị trên cùng một dòng
                      Text(
                        '${item.price} VND', // Cả số tiền và đơn vị
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2), // Tạo khoảng cách
            // Hiển thị thông tin người chi
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Người chi: ${item.user_name}', // Hiển thị giá trị
                style: const TextStyle(fontSize: 19, color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
