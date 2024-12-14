import 'package:flutter/material.dart';
import 'package:money/Auth/login_screen.dart'; // Nhớ import trang AddAccountForm


class ParentPage extends StatelessWidget {
  const ParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );

          },
        ),
      ),
    );
  }
}
