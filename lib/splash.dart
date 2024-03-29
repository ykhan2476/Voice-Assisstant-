import 'dart:async';
import 'package:flutter/material.dart';
import 'package:VSmart/voice.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();
    _navigatehome();
    //y dusri screen k baad splash screen vps na aane k liye
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => voice()));
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black,),
            body: SafeArea(
            child:Stack(children: [ 
            Container(height: hght,width: wid,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash.png'),fit: BoxFit.cover)), ),
            Container(height: 30,width: 30,margin: EdgeInsets.only(top: 400,left: wid*0.42),child: CircularProgressIndicator(color: Colors.white,),)],),
    ));
  }
}