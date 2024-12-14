import 'package:flutter/material.dart';
import 'package:money/pages/AddAccountForm.dart'; // Nhớ import trang AddAccountForm
import 'package:money/layouts/body_add_account.dart';
import 'package:money/modal/items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:money/HomePage/home_page_child.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  final List<DataItem2> items = [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    _loadData(); // Tải dữ liệu khi mở trang
  }

  // Lưu dữ liệu vào SharedPreferences
  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();

    // Lưu danh sách tài khoản
    List<String> accounts = items
        .map((item) => '${item.bank_name},${item.user_name},${item.asset}')
        .toList();
    prefs.setStringList('accounts', accounts);

    // Lưu tổng số dư
    prefs.setInt('total', total);
  }

  // Tải dữ liệu từ SharedPreferences
  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    // Tải danh sách tài khoản
    List<String>? accounts = prefs.getStringList('accounts');
    if (accounts != null) {
      setState(() {
        items.clear();
        for (var account in accounts) {
          var parts = account.split(',');
          items.add(DataItem2(
            bank_name: parts[0],
            user_name: parts[1],
            asset: int.parse(parts[2]),
          ));
        }
      });
    }

    // Tải tổng số dư
    int savedTotal =
        prefs.getInt('total') ?? 0; // Nếu không có giá trị, mặc định là 0
    setState(() {
      total = savedTotal;
    });
  }

  // Hàm callback để cập nhật dữ liệu từ trang AddAccountForm
  void _updateAccountInfo(String bankName, String userName, int balance) {
    final newItem =
        DataItem2(user_name: userName, bank_name: bankName, asset: balance);
    setState(() {
      items.add(newItem);
      total += balance;
    });

    _saveData(); // Lưu dữ liệu sau khi thêm mới
  }

  void _clearData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('accounts'); // Xóa danh sách tài khoản
  await prefs.remove('total');    // Xóa tổng số dư
  setState(() {
    items.clear();
    total = 0;
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
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,total
                          );
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
                          size: 30,
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
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
                                "$total",
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
        // Trong trang AddAccount
        body: ListView.builder(
          shrinkWrap: true, // Cho phép ListView tự điều chỉnh kích thước
          physics:
              const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn bên trong
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: MyBody(
                item: items[index],
                onDelete: () {
                  setState(() {
                    items.removeAt(index); // Xóa tài khoản khỏi danh sách
                  });
                  _saveData(); // Lưu lại sau khi xóa
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
