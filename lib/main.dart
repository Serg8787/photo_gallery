import 'package:flutter/material.dart';
import 'package:photo_gallery/provider/galery_data.dart';
import 'package:photo_gallery/screens/photo_gallery.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context,)=>GaleryData()..getImages(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: PhotoGallery()
      ),
    );
  }
}




