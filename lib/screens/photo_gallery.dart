import 'package:flutter/material.dart';
import 'package:photo_gallery/keys.dart';
import 'package:photo_gallery/services/network_helper.dart';

class PhotoGallery extends StatefulWidget {


  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {

  // Future<List<String>>? images;
  List<String>? images;

  Future<List<String>> getImages() async {
    List<String> images = [];
    String url = "https://pixabay.com/api/?key=$pixabayApiKey&per_page=30&image_type=photo";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> hitsList = data["hits"] as List;

    for (int i = 0; i < hitsList.length; i++) {
      images.add(hitsList[i]["largeImageURL"]);
    }
    return images;
  }

    @override
    void initState() {
      super.initState();
     // images = getImages();
      getImages().then((value) => print(value));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6), itemBuilder: (context, index) {
          return Container();
        }),
      ),
    );
  }
}
