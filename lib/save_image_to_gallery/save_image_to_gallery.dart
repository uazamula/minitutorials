import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

//   gallery_saver: ^2.3.2
//   dio: ^4.0.6
// path_provider: ^2.0.10

//*** for Android
// 1) go android/app/build.gradle
// change to minSdkVersion 21

//*** for IOs
// go ios/Runner/Info.plist
// add at the beginning of <dict>
// <key>NSPhotoLibraryUsageDescription</key>
// <string>We need access to photo library </string>

class SaveImageToGallery extends StatefulWidget {
  const SaveImageToGallery({Key? key}) : super(key: key);

  @override
  _SaveImageToGalleryState createState() => _SaveImageToGalleryState();
}

class _SaveImageToGalleryState extends State<SaveImageToGallery> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageLink =
        'https://www.state.gov/wp-content/uploads/2019/04/ukraine-1024x683.jpg';
    return Scaffold(
      appBar: AppBar(
        title: const Text('SaveImageToGallery)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(
            child: Column(
              children: [
                Image.network(
                  imageLink,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  child: Text('Download'),
                  onPressed: () async {
                    await GallerySaver.saveImage(imageLink,
                        albumName: 'Flutter');
                  },
                ),
              ],
            ),
          ),


          Center(
            child: Column(
              children: [
                Image.network(
                  imageLink,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  child: Text('Download via temp storage'),
                  onPressed: () async {
                    final tempDir = await getTemporaryDirectory();
                    final path = '${tempDir.path}/myfile.jpg';
                    await Dio().download(imageLink, path);
                    await GallerySaver.saveImage(path);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Downloaded to Gallery')));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
