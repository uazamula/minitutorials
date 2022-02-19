import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class MaskAnyImage extends StatefulWidget {
  const MaskAnyImage({Key? key}) : super(key: key);

  @override
  _MaskAnyImageState createState() => _MaskAnyImageState();
}

class _MaskAnyImageState extends State<MaskAnyImage> {


  @override
  Widget build(BuildContext context) {
    bool isImage = true;
    bool isLogo = false;
    bool isTop = false;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text('MaskAnyImage)')),
      body: Center(
        child: Container(
          // height: 350,
          color: Colors.yellow,
          child: WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            child: isImage
                ? Image.asset(
                    // 'assets/images/star149811.png',
                    'assets/images/explosion.png',
                    width: 250,
                  )
                : isLogo
                    ? FlutterLogo(
                        size: 300,
                      )
                    : Text(
                        'ABC',
                        style:
                            TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                      ),
            mask: Image.asset(
              'assets/images/brailka.jpg',
              fit: BoxFit.cover,
              alignment: isTop? Alignment.topCenter : Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
