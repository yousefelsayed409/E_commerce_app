
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void flutterToast({required String message}){{
  Fluttertoast.showToast(
        msg:message,
        toastLength: Toast.LENGTH_SHORT,
        
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor:Colors.black54
,
        textColor:Colors.white,
        fontSize: 16.0
    );

}}