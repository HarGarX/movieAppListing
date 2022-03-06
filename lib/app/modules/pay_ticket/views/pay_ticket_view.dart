import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../book_ticket/views/book_ticket_view.dart';
import '../controllers/pay_ticket_controller.dart';

class PayTicketView extends GetView<PayTicketController> {
  var releaseDateFormat = DateFormat("MMMM dd, yyyy");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayTicketController>(
      init: PayTicketController(),
      initState: (payTicketController) {},
      builder: (payTicketController) {
        return Scaffold(
          bottomSheet: Container(
            height: 25.h,
            color: Color(0xffffffff),
            margin: EdgeInsets.all(0.0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.chair,
                      color: Color(0xffCD9D0F),
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Text(
                      'Selected',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(
                      width: 15.h,
                    ),
                    Icon(
                      Icons.chair,
                      color: Color(0xffA6A6A6),
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Text(
                      'Not available',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.chair,
                      color: Color(0xff564CA3),
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Text(
                      'VIP (150\$)',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(
                      width: 15.h,
                    ),
                    Icon(
                      Icons.chair,
                      color: Color(0xff61C3F2),
                      size: 18,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Text(
                      'Regular',
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size(25.0.w, 6.5.h)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffEFEFEF)),
                      ),
                      onPressed: () async {
                        // Get.toNamed(Routes.WATCH_TRAILER, arguments: [
                        //   singleMovieController.movieModel,
                        //   singleMovieController.movieService.movieVideoList
                        // ]);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                          ),
                          SizedBox(
                            height: 0.0,
                          ),
                          Text(
                            "\$ 50",
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size(65.0.w, 6.5.h)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xFF61C3F2)))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF61C3F2)),
                      ),
                      onPressed: () async {},
                      child: Text(
                        "Proceed to pay",
                        style: GoogleFonts.poppins(
                          color: const Color(0xffffffff),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(12.0),
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
                        Text(payTicketController.movieModel.title,
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
                            "In Theaters ${releaseDateFormat.format(payTicketController.movieModel.releaseDate)}",
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
                child: Container(
                  height: 75.h,
                  width: 95.w,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // First Seat Row

                      Center(
                        child: Image.asset(
                          'assets/images/screen.png',
                          fit: BoxFit.contain,
                          width: 600,
                          color: Color(0xff61C3F2),
                        ),
                      ),
                      Text(
                        'screen',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff202C43),
                        ),
                      ),
                      // First Seat Row
                      SeatsFirstRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      // Second Row
                      SeatsSecondRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsSecondRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsSecondRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      // ThirdRow
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                      SeatsThirdRow(
                        marginHorizontal: 4.0,
                        marinVertical: 12.0,
                        containerHeight: 10.0,
                        containerWidth: 5.5,
                        iconSize: 10.0,
                      ),
                    ],
                  ).paddingAll(5.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
