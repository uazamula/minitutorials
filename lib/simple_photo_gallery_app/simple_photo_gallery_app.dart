import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class SimplePhotoGalleryApp extends StatefulWidget {
  // static int myIndex = 1;

  const SimplePhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _SimplePhotoGalleryAppState createState() => _SimplePhotoGalleryAppState();
}

class _SimplePhotoGalleryAppState extends State<SimplePhotoGalleryApp> {
  int myIndex = 1;
  final List<String> urlImages = [
    'assets/images/buddha.jpg',
    'assets/images/brailka.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SimplePhotoGalleryApp)')),
      body: Center(
        child: InkWell(
          child: Ink.image(
            image: AssetImage(urlImages[myIndex]),
            height: 300,
            fit: BoxFit.cover,
          ),
          onTap: openGallery,
        ),
      ),
    );
  }

  void openGallery() async {
    final returnedImageIndex =
        await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => GalleryWidget(
        urlImages: urlImages,
        index: myIndex,
      ),
    ));
    if (returnedImageIndex == null) return;

    setState(() {
      myIndex = returnedImageIndex;
    });
  }
}

class GalleryWidget extends StatefulWidget {
  final PageController pageController;
  final List<String> urlImages;
  final int index;

  GalleryWidget({required this.urlImages, this.index = 0})
      : pageController = PageController(initialPage: index);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int index = widget.index;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // SimplePhotoGalleryApp.myIndex=index;
        Navigator.of(context).pop(index);
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PhotoViewGallery.builder(
              pageController: widget.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.urlImages.length,
              builder: (context, index) {
                final urlImage = widget.urlImages[index];
                return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(urlImage),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 4);
              },
              onPageChanged: (index) {
                setState(() {
                  this.index = index;
                });
              },
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Image ${index + 1}/${widget.urlImages.length}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
