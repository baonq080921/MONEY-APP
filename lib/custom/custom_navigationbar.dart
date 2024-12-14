import 'package:flutter/material.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Mục hiện tại
      onTap: onItemTapped, // Hàm xử lý sự kiện khi chọn mục
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang 1',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Trang 2',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Trang 3',
        ),
      ],
    );
  }
}