import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money/pages/add_balance.dart';
import 'package:money/pages/add_account.dart';
import 'package:money/pages/more.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Chỉ mục của tab hiện tại
  int _selectedIndex = 0;
  

  final List<Widget>_page = [
    const Homepage(),
    const AddAccount(),
    const AddBalance(),
    const MorePage(),  
  ];


  // Hàm để xử lý khi người dùng chọn tab
  void _onItemTapped(int index) {
  if (index == 0) {
    // Không làm gì vì đây là trang hiện tại
    return;
  }

  // Điều hướng đến trang tương ứng
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => _page[index]),
  ).then((_) {
    // Quay lại trang chính (Homepage) sau khi người dùng trở về
    setState(() {
      _selectedIndex = 0;
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2FCFC),
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
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // Xử lý sự kiện khi nhấn vào icon bên trái
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
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          // Xử lý sự kiện khi nhấn vào icon bên phải
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Column(
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
                                "1.000.000.000 VND",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 44,
                          color: Colors.white,
                          icon: const Icon(Icons.camera_alt_rounded),
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
          child: Text('Content of the page$_selectedIndex'),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,  // Chỉ mục tab hiện tại
          height: 60.0,  // Chiều cao của bottom navigation
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.add,size: 30),
            Icon(Icons.more_horiz, size: 30),
          ],
          color: Colors.white,  // Màu nền của BottomNavigationBar
          buttonBackgroundColor: Colors.teal,  // Màu của nút bấm
          backgroundColor: Colors.transparent,  // Màu nền của thanh điều hướng
          onTap: _onItemTapped,  // Hàm xử lý khi nhấn tab
        ),
      ),
    );
  }
}
