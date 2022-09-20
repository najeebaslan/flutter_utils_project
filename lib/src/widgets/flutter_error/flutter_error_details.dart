import 'package:flutter/material.dart';

class FlutterErrorPage{
 static flutterErrorDetails (){
        ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
      title: const Text('Error Page',
      style: TextStyle(color: Colors.black),),),
      body: ListView(children: [
        Container(
        color: const Color(0xFF1639D8),
        child: Text(
          details.toString(),
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      ),],)
    );
  };
}
}