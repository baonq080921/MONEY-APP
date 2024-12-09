import 'package:flutter/material.dart';
import 'package:money/pages/AddAccountForm.dart'; // Nhớ import trang AddAccountForm

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  String _bankName = "Ngân hàng ABC";
  String _userName = "Nguyễn Văn A";
  String _balance = "1.000.000.000";

  // Hàm callback để cập nhật dữ liệu từ trang AddAccountForm
  void _updateAccountInfo(String bankName, String userName, String balance) {
    setState(() {
      _bankName = bankName;
      _userName = userName;
      _balance = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF2FCFC),
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.teal,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.white,
                        iconSize: 24,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Quay lại trang trước
                        },
                      ),
                      const Text(
                        "Tài Khoản",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        color: Colors.white,
                        iconSize: 24,
                        icon: const Icon(
                          Icons.add,
                          size: 40,
                        ),
                        onPressed: () {
                          // Điều hướng sang trang nhập liệu
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAccountForm(
                                onAdd: _updateAccountInfo, // Truyền callback
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 349,
                          height: 61,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child:  Column(
                            children: [
                              Text(
                                "Tổng số dư",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$_balance VND",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(
                    title: "Ngân hàng",
                    content: _bankName,
                    user_info: _userName,
                    balance: _balance,
                    icon: Icons.account_balance,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title,
      required String content,
      required String user_info,
      required String balance,
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
    );
  }
}
