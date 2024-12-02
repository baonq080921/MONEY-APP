import 'package:flutter/material.dart';
import 'package:money/custom/rounded_check_box.dart';
import 'package:money/HomePage/home_page.dart';
import 'package:money/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true; // Biến để kiểm tra trạng thái đăng nhập hay đăng ký

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Thêm SingleChildScrollView để cuộn nội dung
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.teal, // Màu nền chính
          ),

          child: Column(
            children: <Widget>[
              const SizedBox(height: 150),
              // Phần vùng màu trắng chứa form
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      // Thanh chọn Đăng nhập và Đăng ký
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = true;
                                });
                              },
                              child: Text(
                                "Đăng Nhập",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: isLogin ? Colors.teal : Colors.grey,
                                  fontWeight: isLogin ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = false;
                                });
                              },
                              child: Text(
                                "Đăng Ký",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: !isLogin ? Colors.teal : Colors.grey,
                                  fontWeight: !isLogin ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Giao diện theo từng trạng thái
                      isLogin ? buildLoginForm() : buildRegisterForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),  // Quay lại trang Intro
          );
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.arrow_back),  // Mũi tên quay lại
      ),
    );

  }

  // Form đăng nhập
  Widget buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50,),
        const Text(
          "Đăng nhập vào tài khoản",
          style: TextStyle(
              fontSize: 22,
              color: Colors.teal,
              fontWeight: FontWeight.w600
          ),),
        SizedBox(height: 40,),
        const Text(
          "Tài khoản",
          style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        buildInputField("Nhập tài khoản của bạn", false),
        const SizedBox(height: 20),
        const Text(
          "Mật khẩu",
          style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        buildInputField("Nhập mật khẩu của bạn", true),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StatefulBuilder(
              builder: (context, setState) {
                bool isRememberChecked = false; // Biến lưu trạng thái của checkbox
                return Row(
                  children: [
                    RoundedCheckbox(
                      value: isRememberChecked,
                      onChanged: (value) {
                        setState(() {
                          isRememberChecked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    Text("Lưu thông tin đăng nhập",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.teal,
                      fontWeight: FontWeight.w600
                    ),),
                    SizedBox(width: 80,),
                    Text("Quên mật khẩu?",style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.teal,
                      decorationThickness: 1.5,
                      color: Colors.teal,
                      fontWeight: FontWeight.w800
                    ),)
                    
                  ],
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 80),
        buildSubmitButton("Đăng Nhập"),
      ],
    );
  }

  // Form đăng ký
  Widget buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40,),
        const Text(
          "Đăng ký tài khoản",
          style: TextStyle(
            fontSize: 22,
            color: Colors.teal,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Tài khoản",
          style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        buildInputField("Nhập tài khoản của bạn", false),
        const SizedBox(height: 20),
        const Text(
          "Mật khẩu",
          style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        buildInputField("Nhập mật khẩu của bạn", true),
        const SizedBox(height: 20),
        const Text(
          "Nhập lại mật khẩu",
          style: TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        buildInputField("Nhập lại mật khẩu của bạn", true),
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StatefulBuilder(
              builder: (context, setState) {
                bool isRememberChecked = false; // Biến lưu trạng thái của checkbox
                return Row(
                  children: [
                    RoundedCheckbox(
                      value: isRememberChecked,
                      onChanged: (value) {
                        setState(() {
                          isRememberChecked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 10,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Bằng cách tick vào đây, bạn đồng ý với ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.teal,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: "\nCác điều khoản của chúng tôi",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.teal,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline, // Gạch chân
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 80),
        buildSubmitButton("Đăng Ký"),
      ],
    );
  }

  // Widget cho trường nhập liệu
  Widget buildInputField(String hint, bool obscureText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  // Nút gửi form
  Widget buildSubmitButton(String text) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print("$text thành công");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}