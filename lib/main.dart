import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Dio dio = Dio();

  void post() async {
    var response = await dio
        .post("https://58f6-84-54-115-212.ngrok-free.app/api/employees", data: {
      "name": "Rahmatillo",
      "email": "Rahmatillo@gmail.com",
      "password": "2222",
      "phone": "+998901234567"
    });
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              post();
            },
            child: Text("POST"),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
