
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//   youtube_player_flutter: ^8.1.0
class MyYoutubePlayer extends StatefulWidget {
  const MyYoutubePlayer({Key? key}) : super(key: key);

  @override
  _MyYoutubePlayerState createState() => _MyYoutubePlayerState();
}

class _MyYoutubePlayerState extends State<MyYoutubePlayer> {
  final pageController = PageController(initialPage: 0);
  late YoutubePlayerController controller;
  String playOrPause='Play';
  String muteOrUnmute = 'Mute';
  int saveVolume = 0;
  bool isMute=false;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=YE7VzlLtp-4';
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: YoutubePlayerFlags(
        mute: false, // is video sound playing?
        loop: false, // is same video repeated?
        autoPlay: false, // is video played when initialized?
        hideControls: false,
      ),
    )..addListener(() {
      if(mounted){
        setState(() {

        });
      }
    });
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyYoutubePlayer)'),
        actions: [
          IconButton(
              onPressed: () => pageController.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => pageController.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: controller,
            ),
            builder: (context, player) => Scaffold(
              appBar: AppBar(
                title: Text('Youtube Player'),
              ),
              body: ListView(
                children: [
                  player,
                  Text(controller.metadata.title),
                  Text(controller.metadata.author),
                  Text('${controller.metadata.duration.inMinutes} minutes'),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: Text('Next video'),
                    onPressed: () {
                      const url='https://www.youtube.com/watch?v=GQyWIur03aw&list=PL1WkZqhlAdC_MPQBXUFwAHviZ3XkWPDBG&index=41';
                      controller.load(YoutubePlayer.convertUrlToId(url)!);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: Text('Full Screen'),
                    onPressed: () {
                      controller.toggleFullScreenMode();
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: Text(playOrPause),
                    onPressed: () {
                      if(controller.value.isPlaying){
                        controller.pause();
                        setState(() {
                          playOrPause='Play';
                        });
                      } else {
                        controller.play();
                        setState(() {
                          playOrPause='Pause';
                        });
                      }
                    },
                  ),
                  ElevatedButton(
                    child: Text('jump to 10 sec'),
                    onPressed: () {
                      controller.seekTo(Duration(seconds: controller.value.position.inSeconds+ 10));
                    },
                  ),
                  ElevatedButton(
                    child: Text(muteOrUnmute),
                    onPressed: () {
                      if(!isMute) {
                        controller.mute();
                        setState(() {
                          muteOrUnmute = 'UnMute';
                        });
                         isMute=true;
                      }
                      else{
                        controller.unMute();
                        setState(() {
                          muteOrUnmute = 'Mute';
                        });
                        isMute=false;
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
