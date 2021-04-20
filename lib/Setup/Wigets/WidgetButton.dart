import 'package:flutter/material.dart';
import 'package:flutter_auth/Setup/Pages/Calendar/Calendar.dart';
import 'package:flutter_auth/Setup/Pages/Home.dart';
import 'package:flutter_auth/Setup/Pages/Profile.dart';

Widget FitnessButton(String text,register){
  
  return
            MaterialButton(
                    height: 60.0, 
                    minWidth: 336.0, 
                    onPressed: register,
                   
                    color: Color.fromRGBO(230,26,80,1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Text(text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        )
                    ),
            )
          ;
}