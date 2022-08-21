import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTP(),
    ),
  );
}

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  var length = "";
  var length2 = 0;
  var Decor = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
      colors: [
        Color(0xffffe8b8),
        Color(0xfff6db87),
      ],
    ),
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: Color(0xffffe8b8),
        offset: Offset(0, 0.7),
        blurRadius: 3,
        spreadRadius: 0.5,
      )
    ],
  );
  var MyStyle = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: Color(0xff15172b),
  );
  var Box1 = 0;
  var otp = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff15172b),
        centerTitle: true,
        title: const Text(
          "OTP Generator",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xfff6db87),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff15172b),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 200,
              child: TextField(
                onChanged: (v) {
                  setState(() {
                    length = v;
                    length2 = int.parse(length);
                  });
                },
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xfffcf6ba),
                ),
                decoration: const InputDecoration(
                  hintText: "Enter OTP Length",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  otp.clear();
                  call(length2);
                });
              },
              child: Container(
                height: 50,
                width: 260,
                alignment: Alignment.center,
                child: Text(
                  "Generate OTP",
                  style: MyStyle,
                ),
                decoration: Decor,
              ),
            ),
            Container(
              height: 80,
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: otp
                    .map((e) => Text(
                          "$e",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ))
                    .toList(),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffffe8b8),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  otp.clear();
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 180,
                child: Text(
                  "Reset",
                  style: MyStyle,
                ),
                decoration: Decor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void call(var l) {
    Random random = Random();
    for (int i = 0; i < l; i++) {
      Box1 = random.nextInt(10);
      otp.add(Box1);
    }
  }
}
