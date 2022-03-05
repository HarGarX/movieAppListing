import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielistapp/app/modules/search_result/widgets/genre_widget.dart';
import 'package:movielistapp/core/widgets/custom_anim_search_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends GetView<SearchResultController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2E2739).withOpacity(0.1),
    ));
    return GetBuilder<SearchResultController>(
      init: SearchResultController(),
      initState: (searchResultController) {},
      builder: (searchResultController) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFFEFEFEF),
            appBar: AppBar(
              // shadowColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: (() => Get.back()),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Color(0xFF202C43),
                  ),
                ),
              ).paddingOnly(left: 0.0, bottom: 8.0),
              centerTitle: true,
              toolbarHeight: 15.h,
              // leadingWidth: 5.w,

              actions: [
                Center(
                  child: CustomAnimSearchBar(
                    helpText: 'TV shows, movies and more',
                    rtl: true,
                    width: 90.w,
                    closeSearchOnSuffixTap: true,
                    suffixIcon: Icon(
                      Icons.close,
                      color: Color(0xFF202C43),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF202C43),
                    ),
                    color: Color(0xFFF2F2F6),
                    // TODO : Check TextOverflow Eplipse in this
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Color.fromARGB(255, 32, 44, 67).withOpacity(0.3),
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    textController:
                        searchResultController.searchBarTextController,
                    onSuffixTap: () {
                      searchResultController.searchBarTextController.clear();
                      Get.back();
                    },
                  ).paddingOnly(
                      top: 8.0, right: 15.0, bottom: 15.0, left: 15.0),
                ),
              ],
            ),
            body: searchResultController.isLoading.isTrue
                ? Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color(0xFF2E2739),
                      backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.all(1.0.w).copyWith(top: 3.5.h),
                      child: searchResultController
                              .searchMoviesByTermResultList.isEmpty
                          ? GridView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 0.0,
                              ),
                              itemCount: searchResultController
                                      .searchMoviesByTermResultList.isEmpty
                                  ? 10
                                  : searchResultController
                                      .searchMoviesByTermResultList.length,
                              itemBuilder: ((context, index) {
                                return GenreWidget(
                                  movieModel: searchResultController
                                      .movieService.upComingMoviesList[index],
                                  index: index,
                                );
                              }),
                            )
                          : SearchResultWidget(),
                      // child: Container(),
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class SearchResultWidget extends GetView<SearchResultController> {
  SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(
      init: SearchResultController(),
      initState: (searchResultController) {},
      builder: (searchResultController) {
        return searchResultController.isLoading.isTrue
            ? Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Color(0xFF2E2739),
                  backgroundColor: Color(0xFF2E2739).withOpacity(0.1),
                ),
              )
            : Container(
                color: Color(0xFFEFEFEF),
                padding: EdgeInsets.all(2.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Top Result',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF202C43),
                      ),
                    ),
                    Container(
                      height: 0.15.h,
                      margin: EdgeInsets.only(top: 1.0.h, bottom: 1.0.h),
                      width: 85.w,
                      color: Color(0xff000000).withOpacity(0.11),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  width: 130.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(15.0),
                                      image:
                                          // searchResultController
                                          //             .searchMoviesByTermResultList[
                                          //                 index]
                                          //             .backdropPath ==
                                          //         null
                                          //     ?
                                          DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          "https://image.tmdb.org/t/p/w500/${searchResultController.searchMoviesByTermResultList[index].backdropPath}",
                                        ),
                                        fit: BoxFit.cover,
                                      )

                                      // : DecorationImage(
                                      //     image: AssetImage(
                                      //         'assets/images/pngegg.png')),
                                      ),
                                ),
                                SizedBox(
                                  width: 4.0.w,
                                ),
                                Container(
                                  width: 45.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        searchResultController
                                            .searchMoviesByTermResultList[index]
                                            .title,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          color: Color(0xff202C43),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        searchResultController.movieService
                                            .getGenreName(
                                                genreId: searchResultController
                                                    .searchMoviesByTermResultList[
                                                        index]
                                                    .genreIds[0]),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.fade,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          color: Color(0xffDBDBDF),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Color(0xff61C3F2),
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                ));
      },
    );
  }
}
