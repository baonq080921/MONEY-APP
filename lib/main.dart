import 'package:flutter/material.dart';
import 'package:money/Auth/login_screen.dart';
import 'package:money/Screen/screen1.dart';
import 'package:money/Screen/screen2.dart';
import 'package:money/Screen/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();

  // Hàm để chuyển đến trang kế tiếp
  void goToNextPage() {
    int nextPage = pageController.page!.toInt() + 1; // Lấy chỉ số trang hiện tại và cộng thêm 1

    if (nextPage >= 3) {
      // Nếu đã đến trang cuối cùng, chuyển đến màn hình đăng nhập
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // Nếu chưa đến trang cuối cùng, chuyển đến trang kế tiếp
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // PageView để chuyển trang
          PageView(
            controller: pageController,
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),

            ],
          ),
          // Indicator trang (SmoothPageIndicator)
          Positioned(
            bottom: 200,
            child: SmoothPageIndicator(

              controller: pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.teal,
                dotColor: Colors.teal.withOpacity(0.3),
              ),
            ),
          ),

          // Nút chuyển trang
          Positioned(
            bottom: 100,
            child: SizedBox(
              width: 300, // Chiều rộng của nút
              child: ElevatedButton(
                onPressed: goToNextPage, // Mỗi lần nhấn, chuyển sang trang kế tiếp
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Màu nền của nút
                  padding: const EdgeInsets.symmetric(vertical: 15), // Độ dày của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bo tròn góc
                  ),
                ),
                child: const Text(
                  'Tiếp Theo',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white, // Màu chữ trong nút
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
