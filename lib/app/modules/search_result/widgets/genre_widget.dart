import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/modules/search_result/controllers/search_result_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenreWidget extends GetView<SearchResultController> {
  final MovieModel movieModel;
  final int index;
  const GenreWidget({Key? key, required this.movieModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List genreList = [
      'Crime',
      'Comedies',
      'Dramas',
      'Horror',
      'Family',
      'Documentaries',
      'Fantasy',
      'Holidays',
      'Sci-Fi',
      'Thriller',
    ];
    return GestureDetector(
        onTap: (() => {}),
        child: Card(
          color: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
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
                genreList[index],
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ).marginAll(20.0),
          ),
        ).marginOnly(top: 1.0.h, left: 1.0.h, right: 1.0.h, bottom: 2.0.h));
  }
}
