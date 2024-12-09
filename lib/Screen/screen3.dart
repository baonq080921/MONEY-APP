import 'package:flutter/material.dart';
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/image3.png'),
        const SizedBox(height: 20),
        const Text("Đồ thị trực quan",style: TextStyle(
            color: Colors.teal,
            fontSize:25,
            fontWeight: FontWeight.w500
        ),),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10) ,
          child: Text("Kiểm soát tài chính dễ dàng và trực quan\n hơn với đồ thị",style: TextStyle(
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
