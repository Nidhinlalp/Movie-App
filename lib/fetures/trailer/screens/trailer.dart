import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import '../../../models/trailer_model.dart';

// TrailerPage: Displays a trailer video.
class TrailerPage extends StatefulWidget {
  const TrailerPage({Key? key, required this.trailerModel}) : super(key: key);
  final List<TrailerModel>? trailerModel;

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  PodPlayerController playerController = PodPlayerController(
    playVideoFrom: PlayVideoFrom.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    ),
  );
  double pos = 0;

  @override
  void initState() {
    super.initState();
    initializer();

    // Add a listener to check if the video has almost finished, then pop the page.
    playerController.addListener(
      () {
        if (playerController.totalVideoLength.inSeconds -
                playerController.currentVideoPosition.inSeconds <
            2) {
          Navigator.pop(context);
        }
      },
    );

    // Delayed animation for a smoother transition.
    Future.delayed(
      const Duration(milliseconds: 300),
      () => setState(
        () {
          pos = 1;
        },
      ),
    );

    playerController.initialise();
  }

  void initializer() {
    if (widget.trailerModel != null && widget.trailerModel!.isNotEmpty) {
      String? key;
      try {
        // Attempt to find a teaser trailer key.
        key = widget.trailerModel!
            .firstWhere((element) => element.type == "Teaser")
            .key;
      } catch (e) {
        debugPrint('Error : $e');
      }

      // Create a PodPlayerController based on the found key or the first trailer key.
      playerController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.youtube(
          "https://www.youtube.com/watch?v=${key ?? widget.trailerModel!.first.key}",
        ),
      );

      setState(() {});
    }
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            // Animated video player.
            AnimatedScale(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              scale: pos,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PodVideoPlayer(controller: playerController),
              ),
            ),
            // Done button.
            Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(-10, 43),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.elasticIn,
                  opacity: pos,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticIn,
                    scale: pos == 0 ? 2 : 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Done"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
