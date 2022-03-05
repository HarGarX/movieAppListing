import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/data/models/movie_video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerController extends GetxController {
  final isLoading = false.obs;
  final MovieModel movieModel = Get.arguments[0];
  final RxList<MovieVideoModel> movieVideoList = Get.arguments[1];
  late final YoutubePlayerController youtubePlayerController;

  late String initialVideoId;

  @override
  void onInit() {
    super.onInit();
    for (var element in movieVideoList) {
      element.type == 'Trailer'
          ? initialVideoId = element.key
          : initialVideoId = movieVideoList[0]
              .key; //Getting the first Trailer in the list of movies videos
    }
    String? videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=$initialVideoId");
    print(videoId);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId ?? initialVideoId,
      flags:
          YoutubePlayerFlags(autoPlay: true, mute: false, hideControls: false),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
