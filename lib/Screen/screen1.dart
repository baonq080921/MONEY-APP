import 'package:flutter/material.dart';
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/image1.png'),
        SizedBox(height: 10),
        Text("Quản lý thu chi",style: TextStyle(
          color: Colors.teal,
          fontSize:25,
          fontWeight: FontWeight.w500
        ),),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10) ,
           child: Text("Quản lý thu nhập \nvà chi tiêu trong gia đình",style: TextStyle(
                color: Colors.teal.withOpacity(0.4),
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),
             textAlign: TextAlign.center,
             softWrap: true,
           ),
        )
      ],
    );
  }
}
