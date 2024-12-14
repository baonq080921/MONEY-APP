import 'package:flutter/material.dart';
import 'package:money/HomePage/home_page_child.dart';
class AddBalance extends StatefulWidget {
  
  const AddBalance({super.key});
  

  @override
  State<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  int expense = 0;

  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _typeOfExpense = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF2FCFC),
        appBar: AppBar(
          toolbarHeight: 100,
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
                        icon: const Icon(Icons.arrow_back,size: 30,),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Homepage(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        "Ngân Sách",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      IconButton(
                        color: Colors.white,
                        iconSize: 24,
                        icon: const Icon(Icons.check,size: 30,),
                        onPressed: () {
                          print("check");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Chi tiêu",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 50,
                    color: Colors.teal,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Số Tiền",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.lerp(
                                  FontWeight.w100, FontWeight.w400, 0.5),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "$expense",
                          style: TextStyle(color: Colors.teal, fontSize: 30),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _expenseController,
                      decoration: const InputDecoration(labelText: "Số Tiền "),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: _typeOfExpense,
                      decoration: const InputDecoration(labelText: "Mô tả"),
                    ),
                    TextField(
                      controller: _bankController,
                      decoration: const InputDecoration(labelText: "Ngân Hàng "),
                    ),
                    TextField(
                      controller: _userController,
                      decoration: const InputDecoration(labelText: "Người Thanh Toán"),
                    ),
                    SizedBox(height: 100,),
                    ElevatedButton(
  onPressed: () {
    // Lưu trữ dữ liệu từ các TextField
    Map<String, String> expenseData = {
      'expense': _expenseController.text,
      'description': _typeOfExpense.text,
      'bank': _bankController.text,
      'user': _userController.text,
    };

    // Trả về dữ liệu khi nhấn nút "Lưu"
    Navigator.pop(context, expenseData);
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    minimumSize: const Size(500, 60),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  child: const Text(
    "Lưu",
    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
  ),
),



                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
