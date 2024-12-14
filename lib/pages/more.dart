import 'package:flutter/material.dart';
import 'package:money/HomePage/home_page_child.dart';
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Homepage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
    );
  }
}
