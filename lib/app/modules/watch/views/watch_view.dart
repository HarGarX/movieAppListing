import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielistapp/app/modules/watch/widgets/movie_widget.dart';
import 'package:movielistapp/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/watch_controller.dart';

// KEY   259f88559587d69d838d005f57b77929
// Image Url http://image.tmdb.org/t/p/w500/
class WatchView extends GetView<WatchController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2E2739).withOpacity(0.1),
    ));
    return GetBuilder<WatchController>(
      init: WatchController(),
      initState: (watchController) {},
      builder: (watchController) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
            appBar: AppBar(
              // shadowColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Watch',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF202C43),
                    fontSize: 19.sp,
                    height: 0.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 15.h,
              titleSpacing: 2.w,

              actions: [
                GestureDetector(
                  onTap: (() => Get.toNamed(Routes.SEARCH_RESULT)),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF202C43),
                    ).paddingOnly(
                        top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
                  ),
                ),
              ],
            ),
            body: watchController.isLoading.isTrue
                ? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color(0xFF2E2739),
                      backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.all(4.0.w).copyWith(top: 3.5.h),
                      child: ListView.builder(
                        itemCount: watchController
                            .movieService.upComingMoviesList.length,
                        itemBuilder: ((context, index) {
                          return MovieWidget(
                            movieModel: watchController
                                .movieService.upComingMoviesList[index],
                          );
                        }),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
