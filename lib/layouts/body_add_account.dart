import 'package:flutter/material.dart';
import 'package:money/modal/items.dart';

class MyBody extends StatefulWidget {
  final DataItem2 item;
  final Function onDelete; // Hàm callback để xóa tài khoản
  const MyBody({super.key, required this.item, required this.onDelete});

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoCard(
                title: "Ngân hàng",
                content: widget.item.bank_name,
                user_info: widget.item.user_name,
                balance: widget.item.asset,
                icon: Icons.account_balance,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title,
      required String content,
      required String user_info,
      required int balance,
      required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.teal,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Thông tin người dùng: $user_info",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Số dư tài khoản: $balance VND",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {
              widget.onDelete(); // Gọi hàm xóa khi nhấn vào thùng rác
            },
          ),
        ],
      ),
    );
  }
}
