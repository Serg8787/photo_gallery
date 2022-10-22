import 'package:flutter/material.dart';
import 'package:photo_gallery/provider/galery_data.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatefulWidget {
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: context.watch<GaleryData>().photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6),
              itemBuilder: (context, index) {
                return Image.network(context.watch<GaleryData>().photos[index],
                    fit: BoxFit.cover);
              }),
        ),
      ),
    );
  }
}
