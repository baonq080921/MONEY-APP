import 'package:flutter/material.dart';

class AddAccountForm extends StatefulWidget {
  final Function(String, String, int) onAdd; // Hàm callback để truyền dữ liệu về trang trước

  const AddAccountForm({super.key, required this.onAdd});

  @override
  _AddAccountFormState createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhập thông tin tài khoản"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bankController,
              decoration: const InputDecoration(labelText: "Tên ngân hàng"),
            ),
            TextField(
              controller: _userController,
              decoration: const InputDecoration(labelText: "Tên người dùng"),
            ),
            TextField(
              controller: _balanceController,
              decoration: const InputDecoration(labelText: "Số dư tài khoản"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Chuyển giá trị từ _balanceController.text sang int
                int balance = int.tryParse(_balanceController.text) ?? 0; // Nếu không phải số, gán giá trị mặc định là 0
                // Truyền dữ liệu về trang trước khi nhấn nút
                widget.onAdd(
                  _bankController.text,
                  _userController.text,
                  balance, // Truyền balance dưới dạng int
                );
                Navigator.pop(context); // Quay lại trang trước
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Thêm mới"),
            ),
          ],
        ),
      ),
    );
  }
}
