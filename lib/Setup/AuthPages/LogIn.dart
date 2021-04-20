import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Setup/Pages/Home.dart';
import 'package:flutter_auth/Setup/Wigets/WidgetButton.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State <LoginPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _password2;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: 
         Container(
          color: Color.fromRGBO(17,26,33,1),
          child: Form(
              key: _formKey,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(33,52,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child:Text(
                              "Вхід",
                              style: TextStyle(
                                  color: Color.fromRGBO(230,26,80,1),
                                  fontSize: 49,
                                  fontWeight: FontWeight.w700,
                                ),
                            )
                        ),
                      Container(
                        child:Text(
                              "Увійдіть щоб продовжити",
                              style: TextStyle(
                                  color: Color.fromRGBO(255,255,255,0.42),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                              ),)
                      ),
                    ],
                  ),
                ),
                Center(child:
                Container(
                  margin: EdgeInsets.fromLTRB(22,0,22,0),
                  child:
                  Card(
                    color: Color.fromRGBO(25,36,44,1),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          child:TextFormField(
                            onSaved: (input) => _email = input,
                            validator: (input){
                              if(input.isEmpty){
                                return 'Впишіть номер телефону або email';
                              }
                            },
                            style: TextStyle(color: Color.fromRGBO(255,255,255,0.42)),
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(230,26,80,1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color.fromRGBO(255,255,255,0.26)),   
                              ),  
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(230,26,80,1)),
                              ),
                              
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(255,255,255,0.42),
                                fontSize:15,
                                fontWeight: FontWeight.w400
                              ),
                              hintText: "Номер телефону або email" 
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          
                          child:TextFormField(
                            validator: (input) {
                              if(input.length < 6){
                                return 'Пароль';
                              }
                            },
                            onSaved: (input) => _password = input,
                            style: TextStyle(
                              color: Color.fromRGBO(255,255,255,0.42),
                              fontSize:15,
                              fontWeight: FontWeight.w400
                              ),
                            obscureText: true,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(230,26,80,1),
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: Color.fromRGBO(255,255,255,0.26)),   
                              ),  
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(230,26,80,1)),
                              ),
                              
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(255,255,255,0.42)
                              ),
                              hintText: "Створіть пароль",
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility_off_outlined,color: Color.fromRGBO(255,255,255,0.42)),
                              ),
                            ),
                          )
                        ),
                        
                        Container(
                          margin: EdgeInsets.fromLTRB(17,44,17,17),
                          child: FitnessButton("ОК",signIn),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.fromLTRB(0,0,0,17),
                              child: Text(
                                "Не має акаунта? ",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.42),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  )
                                
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.fromLTRB(0,0,0,17),
                              child: GestureDetector(
                                onTap: () {},
                                child:Text(
                                  "Зареєструйтеся!",
                                  style: TextStyle(
                                    color: Color.fromRGBO(230,26,80,1),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    )
                                )
                              )
                            )
                          ]
                        ),
                      ]
                  )
                ),
                ),
                )
                
              ],
              
            ),
        
        )
      )
    
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
         UserCredential user = await  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
         Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
      }
      catch(e){
        print(e.message);
      }
    }
  }

}