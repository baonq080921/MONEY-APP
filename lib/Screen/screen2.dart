import 'package:flutter/material.dart';
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/image2.png'),
        const SizedBox(height: 5),
        const Text(
          "Danh mục chi tiêu",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Các danh mục giúp bạn quản\nlý chi tiêu dễ dàng hơn",
            style: TextStyle(
              color: Colors.teal.withOpacity(0.4),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center, // Căn giữa văn bản
            softWrap: true, // Cho phép văn bản tự động xuống dòng
          ),
        ),
      ],
    );
  }
}
