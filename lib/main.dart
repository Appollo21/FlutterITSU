import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Setup/Start.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Fitness",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StartPage(),
    );
  }
}

Map<int, Color> color =
{
50:Color.fromRGBO(17,26,33,1),
100:Color.fromRGBO(17,26,33,1),
200:Color.fromRGBO(17,26,33,1),
300:Color.fromRGBO(17,26,33,1),
400:Color.fromRGBO(17,26,33,1),
500:Color.fromRGBO(17,26,33,1),
600:Color.fromRGBO(17,26,33,1),
700:Color.fromRGBO(17,26,33,1),
800:Color.fromRGBO(17,26,33,1),
900:Color.fromRGBO(17,26,33,1),
};

MaterialColor colorCustom = MaterialColor(0xff123123, color);