import 'package:get/get.dart';

import 'package:movielistapp/app/modules/book_ticket/bindings/book_ticket_binding.dart';
import 'package:movielistapp/app/modules/book_ticket/views/book_ticket_view.dart';
import 'package:movielistapp/app/modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import 'package:movielistapp/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:movielistapp/app/modules/home/bindings/home_binding.dart';
import 'package:movielistapp/app/modules/home/views/home_view.dart';
import 'package:movielistapp/app/modules/search_result/bindings/search_result_binding.dart';
import 'package:movielistapp/app/modules/search_result/views/search_result_view.dart';
import 'package:movielistapp/app/modules/single_movie/bindings/single_movie_binding.dart';
import 'package:movielistapp/app/modules/single_movie/views/single_movie_view.dart';
import 'package:movielistapp/app/modules/watch/bindings/watch_binding.dart';
import 'package:movielistapp/app/modules/watch/views/watch_view.dart';
import 'package:movielistapp/app/modules/watch_trailer/bindings/watch_trailer_binding.dart';
import 'package:movielistapp/app/modules/watch_trailer/views/watch_trailer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAV_BAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WATCH,
      page: () => WatchView(),
      binding: WatchBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_MOVIE,
      page: () => SingleMovieView(),
      binding: SingleMovieBinding(),
    ),
    GetPage(
      name: _Paths.WATCH_TRAILER,
      page: () => WatchTrailerView(),
      binding: WatchTrailerBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_TICKET,
      page: () => BookTicketView(),
      binding: BookTicketBinding(),
    ),
  ];
}
