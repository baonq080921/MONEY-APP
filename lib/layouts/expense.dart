import 'package:flutter/material.dart';
import 'package:money/modal/item.dart'; // Đảm bảo đã import DataItem
import 'package:money/layouts/expense_info.dart'; // Đảm bảo đã import ExpenseInfo

class MyExpense extends StatefulWidget {
  final List<DataItem> items; // Thêm tham số items vào constructor
  const MyExpense({super.key, required this.items});

  @override
  State<MyExpense> createState() => _MyExpenseState();
}

class _MyExpenseState extends State<MyExpense> {
  // Sử dụng widget.items để giữ dữ liệu trong state
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Chi tiêu gần đây",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Xem Chi Tiết >>",
                      style: TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                  ),
                ],
              ),
              // Dùng ListView.builder để render danh sách các item
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ExpenseInfo(item: widget.items[index]),  // Gửi data cho ExpenseInfo
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
