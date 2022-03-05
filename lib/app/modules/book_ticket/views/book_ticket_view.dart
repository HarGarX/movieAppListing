import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/book_ticket_controller.dart';

class BookTicketView extends GetView<BookTicketController> {
  var releaseDateFormat = DateFormat("MMMM dd, yyyy");
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookTicketController>(
      init: BookTicketController(),
      initState: (bookTicketController) {},
      builder: (bookTicketController) {
        return Scaffold(
          bottomSheet: Container(
            height: 8.h,
            color: Color(0xffEFEFEF),
            margin: EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(90.0.w, 7.5.h)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color(0xFF61C3F2)))),
                backgroundColor: MaterialStateProperty.all(Color(0xFF61C3F2)),
              ),
              onPressed: () async {
                // Get.toNamed(Routes.WATCH_TRAILER, arguments: [
                //   singleMovieController.movieModel,
                //   singleMovieController.movieService.movieVideoList
                // ]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Seats",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffffffff),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color(0xffEFEFEF),
          body: CustomScrollView(
            slivers: <Widget>[
              //2
              SliverAppBar(
                expandedHeight: 12.0.h,
                collapsedHeight: 12.h,
                // leadingWidth: 30.w,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Color(0xff202C43),
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
                        SizedBox(
                          height: 2.0.h,
                        ),
                        Text(bookTicketController.movieModel.title,
                            style: GoogleFonts.poppins(
                              color: const Color(0xff202C43),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(
                            "In Theaters ${releaseDateFormat.format(bookTicketController.movieModel.releaseDate)}",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff61C3F2),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
              //3
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff202C43),
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ).paddingOnly(
                    top: 12.0.h, left: 6.0.w, right: 6.0.w, bottom: 1.0.w),
              ),

              SliverToBoxAdapter(
                child: Container(
                  height: 40.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookTicketController.dates.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 25.w,
                        padding: EdgeInsets.all(10.5),
                        margin:
                            EdgeInsets.all(5.0).copyWith(top: 0.0, bottom: 0.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              index == 0
                                  ? BoxShadow(
                                      color:
                                          Color(0xff23AAEB).withOpacity(0.27),
                                      spreadRadius: 0.5,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    )
                                  : BoxShadow(
                                      color: Color(0xffA6A6A6)
                                          .withOpacity(0.10)
                                          .withOpacity(0.27),
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    )
                            ],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.0),
                            color: index == 0
                                ? Color(0xff61C3F2)
                                : Color(0xffA6A6A6).withOpacity(0.10)),
                        height: 5.0.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            bookTicketController.dates[index],
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color:
                                  index == 0 ? Colors.white : Color(0xff202C43),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ).paddingOnly(left: 4.0.w, top: 0.0.w),
              ),
            ],
          ),
        );
      },
    );
  }
}
