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
  String _email, _password, _password2;

  @override 
  Widget build(BuildContext context){
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          
          title: Container(margin: EdgeInsets.fromLTRB(0,0,12,0),child: Align(
            alignment: Alignment.centerRight,
            child:Text(
              '1 з 4',
              style: TextStyle(
                color: Color.fromRGBO(255,255,255,0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                ),
              )
            ),),
          leading: IconButton(
            alignment: Alignment(1.15, 0),
            icon:  Icon(
              Icons.arrow_back_ios,
              color:Color.fromRGBO(255,255,255,0.6),
              size:16,
            ),
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        resizeToAvoidBottomInset: false,
        body: 
         Container(
          color: Color.fromRGBO(17,26,33,1),
          child: Form(
              key: _formKey,
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(33,52,0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                return 'Потрібен надійніший пароль';
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
                          margin: EdgeInsets.fromLTRB(17,17,17,0),
                          child:TextFormField(
                            validator: (input) {
                              if(_password == input){
                                return 'Паролі не співпадають';
                              }
                            },
                            onSaved: (input) => _password2 = input,
                            style: TextStyle(color: Color.fromRGBO(255,255,255,0.42)),
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
                              
                              hintText: "Підтвердіть пароль",
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(255,255,255,0.42),
                                fontSize:15,
                                fontWeight: FontWeight.w400
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility_off_outlined,
                                          color: Color.fromRGBO(255,255,255,0.42),),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(17,44,17,17),
                          child: FitnessButton("ДАЛІ",register),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.fromLTRB(0,0,0,17),
                              child: Text(
                                "Вже заєстровані? ",
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
                                  "Вxід!",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Ознайомитися з привилами користування можна ",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.42),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          )
                        
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          
                        }, 
                        child: Text(
                          "Тут!",
                          style: TextStyle(
                            color: Color.fromRGBO(230,26,80,1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            )
                        )
                      ),
                    )
                  ]
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
        //Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage()));
      }
      catch(e){
        print(e.message);
      }
    }
  }
}