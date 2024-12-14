import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money/pages/add_balance.dart';
import 'package:money/pages/add_account.dart';
import 'package:money/pages/more.dart';
import 'package:money/Auth/login_screen.dart';
import 'package:money/layouts/body.dart';
import 'package:intl/intl.dart';
import 'package:money/modal/item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  int balance = 1000000;
  List<DataItem> items = [];

  final List<Widget> _page = [
    const AddAccount(),
    const AddBalance(),
    const MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _page[index - 1],
        ),
      ).then((result) {
        if (result != null && result is Map<String, String>) {
          // Chuyển dữ liệu từ Map sang DataItem và thêm vào danh sách
          setState(() {
            DataItem newItem = DataItem(
              price: result['expense'] ?? '',
              item: result['description'] ?? '',
              bank: result['bank'] ?? '',
              user_name: result['user'] ?? '',
            );
            items.add(newItem); // Thêm vào danh sách items
          });
        }
      });
    }
  }

  void _navigateToAddBalance(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBalance()),
    );

    // Kiểm tra nếu có dữ liệu trả về
    if (result != null && result is Map<String, String>) {
      // Chuyển dữ liệu từ Map sang DataItem và thêm vào danh sách
      setState(() {
        DataItem newItem = DataItem(
          price: result['expense'] ?? '',
          item: result['description'] ?? '',
          bank: result['bank'] ?? '',
          user_name: result['user'] ?? '',
        );
        items.add(newItem); // Thêm vào danh sách items
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    String formattedBalance = NumberFormat('#,##0').format(balance);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        "Trang Chủ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        color: Colors.white,
                        iconSize: 24,
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                        onPressed: () {},
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
                          decoration: const BoxDecoration(
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
                              const SizedBox(height: 10),
                              Text(
                                "$formattedBalance VND",
                                style: const TextStyle(
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
        body:  SingleChildScrollView(
          child: Body(items:items),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.more_horiz, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.teal,
          backgroundColor: Colors.transparent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
