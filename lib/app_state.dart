import 'package:firebase_auth/firebase_auth.dart'
  hide EmailAuthProvider
 ;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ApplicationState extends ChangeNotifier{
  ApplicationState(){
    init();
  }

  bool _login = false;

  bool get login => _login;


  Future<void> init() async{
    // link Firebase to the app
    await Firebase.initializeApp();

    
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider()
    ]);
    FirebaseAuth.instance.userChanges().listen((user){
      if(user != null){
        _login = true;
      }
      else{
        _login = false;
      }
      notifyListeners();
    });
      

  }
}