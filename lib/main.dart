import 'package:audify/bottom%20navigation%202.dart';
import 'package:audify/bottom%20navigations.dart';
import 'package:audify/homepage.dart';
import 'package:audify/model/recipes%20model.dart';
import 'package:audify/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: ProductRecipe(),
    );
  }
}

 