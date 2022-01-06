import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "counter app",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 10;
  Timer? timer;
  bool tog = true;

  starttimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "counter app",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  count = int.parse(val);
                  tog = true;
                });
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Seconds',
                hintStyle: TextStyle(
                  fontSize: 20.0,
                ),
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(''),
                ),
              ),
              maxLength: 6,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: tog,
              child: MaterialButton(
                color: Colors.indigo[900],
                splashColor: Colors.white,
                onPressed: () {
                  starttimer();
                  setState(() {
                    tog = false;
                  });
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            (count > 0)
                ? Text("")
                : Text(
                    'time is up',
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
