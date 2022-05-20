// @dart=2.9
import 'package:ebook/view/bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Ebook",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BottomView(),
        );
      }
    );
  }
}

