import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
//import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: first(),
                type: PageTransitionType
                    .fade, //import pagetransition dependencies and package
                duration: Duration(milliseconds: 500))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          //splash page
          image: AssetImage("images/splash.png"),
          fit: BoxFit.cover, //cover whole screen
        )),
      ),
    );
  }
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  String scannedBarcode = '';
  String barcodeData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Barcode Scanner",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Schyler'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Splash()));
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              child: CarouselSlider(
                items: [
                  Image.asset("images/lib2.png", fit: BoxFit.cover),
                  Image.asset("images/lib3.png", fit: BoxFit.cover),
                  //Image.asset("images/lib3.png", fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 1.0, //one image covers full width
                  autoPlayAnimationDuration: Duration(seconds: 2),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Barcode $barcodeData', // Display additional data here
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.lightBlueAccent),
            ),
            Text(
              scannedBarcode,
              style: TextStyle(fontSize: 20), // Adjust font size as needed
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                  setState(() {
                    if (res is String) {
                      scannedBarcode = res;
                    }
                  });
                },
                child: Image.asset(
                  "images/bar.png",
                  //width: 200,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
