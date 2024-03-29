import 'package:flutter/material.dart';
import 'package:VSmart/splash.dart';

//import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;


void main() async{
  runApp(const MyApp());
 // WidgetsFlutterBinding.ensureInitialized();
 // await langdetect.initLangDetect();  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VSmart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

