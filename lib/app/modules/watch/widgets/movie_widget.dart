import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/modules/watch/controllers/watch_controller.dart';
import 'package:movielistapp/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MovieWidget extends GetView<WatchController> {
  final MovieModel movieModel;
  const MovieWidget({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.toNamed(Routes.SINGLE_MOVIE, arguments: [movieModel])),
      child: Card(
        color: Color(0xffEFEFEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.243
              : 50.h,
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  "https://image.tmdb.org/t/p/w500/${movieModel.backdropPath}",
                ),
                fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              movieModel.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ).marginAll(20.0),
        ),
      ).marginOnly(top: 1.0.h, left: 1.0.h, right: 1.0.h, bottom: 2.0.h),
    );
  }
}
