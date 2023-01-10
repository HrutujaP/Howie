import 'package:flutter/material.dart';
import 'package:howie/constants.dart';
import 'package:video_player/video_player.dart';

class LandingScreen extends StatelessWidget {
  static const id = 'landingScreen';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        color: ksecondarycolor1,
        gradient: LinearGradient(
          colors: [
            ksecondarycolor1,
            ksecondarycolor1,
            ksecondarycolor2,
            ksecondarycolor1,
            ksecondarycolor2,
            ksecondarycolor2,
            ksecondarycolor2,
            ksecondarycolor2,
            ksecondarycolor2,
            // ksecondarycolor1,
            // ksecondarycolor1,
            ksecondarycolor1,
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onVerticalDragUpdate: ((details) {
          int sen = 8;
          if (details.delta.dy < -sen) {
            Navigator.pushNamed(context, LandingScreen.id);
          }
        }),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(MediaQuery.of(context).size.width * 0.1),
                bottomRight:
                    Radius.circular(MediaQuery.of(context).size.width * 0.1),
              ),
              elevation: 20,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ksecondarycolor1,
                        ksecondarycolor1,
                        ksecondarycolor1,
                        ksecondarycolor2,
                        ksecondarycolor2,
                        ksecondarycolor1,
                        ksecondarycolor1,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    color: ksecondarycolor1,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        const Center(
                            child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/howie_icon.png')),
                        )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'New Jump to Start',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03),
                        ),
                        Text(
                          'N\tL\tP',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurpleAccent,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04),
                        ),
                        Text(
                          'Natural Language Processes',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.028),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Get your queires answered',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                        Text(
                          'And your imaginations generated',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                        const Spacer(),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            (Icons.double_arrow_rounded),
                            color: Colors.amberAccent.shade100,
                            size: 30,
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            (Icons.double_arrow_rounded),
                            color: Colors.amberAccent.shade100,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Swipe to get Started',
              style: TextStyle(
                  color: ksecondarycolor1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer()
          ],
        ),
      ),
    )));
  }
}

class LandingVideoPlayer extends StatefulWidget {
  const LandingVideoPlayer({super.key});

  @override
  State<LandingVideoPlayer> createState() => _LandingVideoPlayerState();
}

class _LandingVideoPlayerState extends State<LandingVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/voicevideo.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.46,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: VideoPlayer(_controller),
            ),
          )
        : Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
