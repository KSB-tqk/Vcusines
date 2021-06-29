import 'package:flutter/cupertino.dart';
import 'package:vcusines/screens/favorite_screen/favorite_screen.dart';
import 'package:vcusines/screens/home_screens/screens/home_main_screen.dart';
import 'package:vcusines/screens/search_screen/search_screen.dart';
import 'package:vcusines/screens/user_screen/user_screen.dart';

class HomeScreenProvider with ChangeNotifier {
  List listOfPage = [
    HomeMainScreen(),
    SearchScreen(),
    FavoriteScreen(),
    UserScreen(),
  ];
  int currentIndex = 0;
  set setPage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}