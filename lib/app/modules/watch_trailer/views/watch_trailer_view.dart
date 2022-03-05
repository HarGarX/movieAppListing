import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/watch_trailer_controller.dart';

class WatchTrailerView extends GetView<WatchTrailerController> {
  // late String videoId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WatchTrailerController>(
      init: WatchTrailerController(),
      initState: (watchTrailerController) {},
      builder: (watchTrailerController) {
        return WillPopScope(
          onWillPop: () async {
            Get.back();
            return true;
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
              body: watchTrailerController.isLoading.isTrue
                  ? Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Color(0xFF2E2739),
                        backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
                      ),
                    )
                  : YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        onEnded: ((metaData) => Get.back()),
                        showVideoProgressIndicator: true,
                        progressColors: ProgressBarColors(
                            backgroundColor: Colors.white,
                            playedColor: Color(0xff2E2739),
                            bufferedColor: Color(0xffEFEFEF),
                            handleColor: Color(0xff564CA3)),
                        progressIndicatorColor: Color(0xff8F8F8F),
                        topActions: [
                          GestureDetector(
                            onTap: (() {
                              Get.back();
                            }),
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        controller:
                            watchTrailerController.youtubePlayerController,
                      ),
                      builder: (context, player) {
                        return Column(
                          children: [
                            // some widgets
                            player,
                            //some other widgets
                          ],
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
