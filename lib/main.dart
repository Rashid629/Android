import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:comment_box/comment/comment.dart';
import 'dart:convert';
import "chillox.dart";
import "mad.dart";

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Splash Screen",
    home: SplashScreenActivity(),
  ));
}


//Activity For Splash Screen
class SplashScreenActivity extends StatelessWidget {
  const SplashScreenActivity({key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const MyHomePage(),
      title: const Text(
        "Discover Flavourful Delight",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),

      ),
      image: Image.asset("assets/images/Logo.jpg"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 200.0,
      loaderColor: Colors.black,
    );
  }
}

//Home Screen with scroll view to choose the Restaurant
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal-Match'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Looking for something specific?',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondActivity(),
                    ));
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/mad.jpg',
                  ),
                  const Text(
                    'Mad-chef',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage()));
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/chillox.jpg',
                  ),
                  const Text(
                    'Chillox ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondActivity()));
              },
              child: Column(
                children: [
                  Image.asset('assets/images/mad.jpg'),
                  const Text(
                    'Mad-Chef',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage()));
              },
              child: Column(
                children: [
                  Image.asset('assets/images/chillox.jpg'),
                  const Text(
                    'Chillox ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



