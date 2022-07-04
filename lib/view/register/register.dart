// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EbookRegister extends StatefulWidget {
  EbookRegister({Key? key}) : super(key: key);

  @override
  State<EbookRegister> createState() => _EbookRegisterState();
}

class _EbookRegisterState extends State<EbookRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70),
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Free register", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                )
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(top: 15, right: 20, bottom: 30, left: 20),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/image/user.png", 
                      width: 30, 
                      height: 30, 
                      fit: BoxFit.cover
                    )
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white54,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    )
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white54,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    )
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 20),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outlined, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white54,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    )
                  )
                )
              )
            ],
          )
        )
      ),
    );
  }
}