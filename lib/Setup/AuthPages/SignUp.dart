import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/AuthPages/LogIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Setup/Wigets/WidgetButton.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: 
         Container(
          color: Color.fromRGBO(17,26,33,1),
          child: Form(
          key: _formKey,
              child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child:Text(
                              "Реєстрація",
                              style: TextStyle(
                                  color: Color.fromRGBO(230,26,80,1),
                                  fontSize: 49,
                                  fontWeight: FontWeight.w700,
                                ),
                            )
                        ),
                      Container(
                        child:Text(
                              "Створіть акаунт",
                              style: TextStyle(
                                  color: Color.fromRGBO(255,255,255,0.42),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                              ),)
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(22,0,22,0),
                  child:
                  Card(
                    color: Color.fromRGBO(25,36,44,1),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          child:TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              focusColor: Color.fromRGBO(230,26,80,1),
                              hintText: "Номер телефону або email"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          child:TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              focusColor: Color.fromRGBO(230,26,80,1),
                              hintText: "Створіть пароль"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          child:TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              focusColor: Color.fromRGBO(230,26,80,1),
                              hintText: "Підтвердіть пароль"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(17,44,17,17),
                          child: FitnessButton("Далі",register),
                        ),
                      ]
                  )
                ),
                ),

                Container(
                    child: Text(
                      "Ознайомитися з привилами користування можна Тут!",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.42),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        )
                      
                    ),
                )

              ],
              
            ),
        
        )
      )
    
    );
  }
  Future<void> register() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
          UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password
        );
        Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}