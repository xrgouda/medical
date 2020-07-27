import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_profile_assistant/ProfilePage.dart';
import 'package:medical_profile_assistant/Tools/progress_dialog.dart';
//import 'package:notes/Notes/Email_Notes.dart';
import 'package:flutter/widgets.dart';
//import 'package:notes/Tools/progress_dialog.dart';

class CreateUser {
//  final String email;
//  final String password;
//  final String fullName;
//
//  final scaffoldKey = GlobalKey<ScaffoldState>();
//
//  CreateUser({this.email,this.password, this.fullName});

  Future storeNewUser(AuthResult res, context) {
    return Firestore.instance.collection('userData').document(res.user.uid).setData({
      'email': res..user.email,
      'uid': res.user.uid,
      'name': '',
      'mobile': '',
      'address':  '',
      'age':  '',
      'job': '',
      'email':  '',
      'relativeNumber':  '',
      'doctorName': '',
      'doctorNumber':  '',
      'doctorAddress':  '',
      'diseases':  '',
      'surgeries':  '',
      'medication':  '',
    }).then((value){
      closeProgressDialog(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage(user: res)));
    }).catchError((e){
      print('error $e');
    });
  }
}