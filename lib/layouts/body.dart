import 'dart:math';  // Cần thư viện này để randomize
import 'package:flutter/material.dart';
import 'package:money/layouts/expense.dart';
import 'package:money/modal/item.dart';

class Body extends StatefulWidget {
  final List<DataItem> items;
  const Body({super.key, required this.items});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<IconData> iconList = [
    Icons.home,
    Icons.travel_explore,
    Icons.shopping_bag,
    Icons.toys,
    Icons.school,
    Icons.food_bank,
  ];

  // Hàm để random chọn icon từ iconList
  IconData getRandomIcon() {
    Random random = Random();
    return iconList[random.nextInt(iconList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Bao bọc toàn bộ content trong một SingleChildScrollView
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Ngân Sách",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w600),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text("1.000.000 VND", style: TextStyle(
                            fontSize: 20,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Khoản chi trong tháng",style:TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.w400
                      )),
                    ),
                    // Dùng Wrap để hiển thị các icon ngẫu nhiên
                    Wrap(
                      spacing: 8.0, // Khoảng cách giữa các phần tử theo chiều ngang
                      runSpacing: 4.0, // Khoảng cách giữa các phần tử theo chiều dọc
                      children: List.generate(10, (index) {
                        // Random icon cho mỗi phần tử và chỉnh kích thước icon
                        return Icon(
                          getRandomIcon(),
                          size: 40, // Đặt kích thước cho icon (có thể thay đổi giá trị)
                          color: Colors.teal, // Tùy chọn màu cho icon
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            MyExpense(items: widget.items), // Dữ liệu vẫn được truyền qua
          ],
        ),
      ),
    );
  }
}
