import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:movielistapp/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/single_movie_controller.dart';

class SingleMovieView extends GetView<SingleMovieController> {
  var releaseDateFormat = DateFormat("MMMM dd, yyyy");
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleMovieController>(
      init: SingleMovieController(),
      initState: (singleMovieController) {},
      builder: (singleMovieController) {
        return Scaffold(
          //1
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 60.0.h,
                collapsedHeight: 35.h,
                leadingWidth: 30.w,
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Watch',
                            style: GoogleFonts.poppins(
                              color: Color(0xFFFFFFFF),
                              fontSize: 19.sp,
                              height: 4.sp,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    alignment: Alignment.bottomCenter,
                    // height: 55.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "In Theaters ${releaseDateFormat.format(singleMovieController.movieModel.releaseDate)}",
                            style: GoogleFonts.poppins(
                              color: const Color(0xffffffff),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(55.0.w, 0.06.h)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                        color: Color(0xFF61C3F2)))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF61C3F2)),
                          ),
                          onPressed: () async {
                            Get.toNamed(Routes.BOOK_TICKET, arguments: [
                              singleMovieController.movieModel,
                            ]);
                          },
                          child: Text(
                            "Get Tickets",
                            style: GoogleFonts.poppins(
                              color: const Color(0xffffffff),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all(Size(55.0.w, 0.06.h)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                        color: Color(0xFF61C3F2)))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () async {
                            Get.toNamed(Routes.WATCH_TRAILER, arguments: [
                              singleMovieController.movieModel,
                              singleMovieController.movieService.movieVideoList
                            ]);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                              Text(
                                "Watch Trailer",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xffffffff),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: CachedNetworkImage(
                    imageUrl:
                        "http://image.tmdb.org/t/p/w500/${singleMovieController.movieModel.backdropPath}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high),
                      ),
                    ),
                    placeholder: (context, url) => Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Color(0xFF2E2739),
                        backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  // CachedNetworkImageProvider(
                  //         "http://image.tmdb.org/t/p/w500/${singleMovieController.movieModel.backdropPath}",
                  //       ),
                ),
              ),
              //3
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genres",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff202C43),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ).paddingOnly(
                    top: 6.0.w, left: 6.0.w, right: 6.0.w, bottom: 1.0.w),
              ),

              SliverToBoxAdapter(
                child: Container(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: singleMovieController.movieModel.genreIds.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // width: 100.0,
                        padding: EdgeInsets.all(10.5),
                        margin:
                            EdgeInsets.all(5.0).copyWith(top: 0.0, bottom: 0.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0),
                            color: singleMovieController.movieService
                                .getGenreColor(
                                    genreName: singleMovieController
                                        .movieService
                                        .getGenreName(
                                            genreId: singleMovieController
                                                .movieModel.genreIds[index]))),
                        height: 5.0.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            singleMovieController.movieService.getGenreName(
                              genreId: singleMovieController
                                  .movieModel.genreIds[index],
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ).paddingOnly(left: 4.0.w, top: 0.0.w),
              ),

              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 0.2.h,
                      width: 80.w,
                      color: Color(0xff000000).withOpacity(0.05),
                      margin: EdgeInsets.all(2.0.w),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Overview',
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          color: const Color(0xff202C43),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    Container(
                      width: 80.0.w,
                      margin: EdgeInsets.only(top: 2.0.h),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          singleMovieController.movieModel.overview,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8F8F8F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(
                    top: 0.0.w, left: 6.0.w, right: 6.0.w, bottom: 1.0.w),
              ),
            ],
          ),
        );
      },
    );
  }
}
