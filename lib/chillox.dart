import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:comment_box/comment/comment.dart';
import 'dart:convert';
import "main.dart";

var chillSlide = ["Pangkha Wings", "Oreo Shake ", "Naga Drums", "Fish Fingers"];

var chillImages = [
  "assets/images/pangkha.jpg",
  "assets/images/oreo.jpg",
  "assets/images/drum.jpg",
  "assets/images/finger.jpg"
];
//For Chillox
class NewPage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60)
    );

    Future<List<Widget>> madList() async {
      List<Widget> items = new List<Widget>();
      String dataString =
      await DefaultAssetBundle.of(context).loadString("assets/images/data.json");

      List<dynamic> chillJson = jsonDecode(dataString);

      for (var object in chillJson) {
        String finalString = "";
        List<dynamic> dataList = object["placeDesc"];
        dataList.forEach((item) {
          finalString = finalString + item + " | ";
        });

        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey, spreadRadius: 2.0, blurRadius: 5.0)
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Item:  ${object["placeName"]}",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      Text(object["placeName"]),
                      Text(
                        finalString,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                        maxLines: 1,
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      }
      return items;
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Meal Match"),
      //   automaticallyImplyLeading: false,
      // ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 10, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.home), onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),
                          );
                        }),
                        const Text(
                          "             Chillox", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, fontFamily: "Samantha"),
                        ),
                      ],
                    ),
                  ),
                  const Text("Most Selling Items",
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  cSlide(),
                  const Text("Menu",
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  Container(
                    child: FutureBuilder(
                        initialData: const <Widget>[Text(" ")],
                        future: madList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                primary: false,
                                shrinkWrap: true,
                                children: snapshot.data,
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(padding:EdgeInsets.all(10),child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: ' Name')),),
                      const Padding(padding:EdgeInsets.all(10),child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: "Email Address")),),
                      const Padding(padding:EdgeInsets.all(10),child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Comments / Suggestion')),),
                      Padding(padding:const EdgeInsets.all(10),child: ElevatedButton(onPressed: (){},child: Text('Submit'),style: buttonStyle,),)
                    ],
                  ),

                ],
              ),
            )),
      ),
    );
  }
}

class cSlide extends StatelessWidget {
  // const slide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
    PageController(viewportFraction: 0.8, initialPage: 1);
    List<Widget> slides = new List<Widget>();

//Create a loop through the items and create a view for each of the items
    //and add them to the List Slide Widget
    for (int x = 0; x < 4; x++) {
      var chillView = Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(chillImages[x], fit: BoxFit.cover)),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chillSlide[x],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ));
      slides.add(chillView);
    }


    return Container(
      padding: const EdgeInsets.all(10.0),
      width: screenWidth,
      height: screenWidth * 0.9,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: slides,
      ),
    );
  }
}
// class CommentBox extends StatefulWidget {
//
//   @override
//   _CommentBoxState createState() => _CommentBoxState();
// }
//
// class _CommentBoxState extends State<CommentBox> {
//   final TextEditingController _commentController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _commentController,
//           decoration: const InputDecoration(
//             hintText: 'Add a comment...',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Post comment
//             print(_commentController.text);
//           },
//           child: Text('Post'),
//         ),
//       ],
//     );
//   }
// }

