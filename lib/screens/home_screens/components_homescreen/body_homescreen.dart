import 'package:flutter/material.dart';
import 'package:vcusines/components/constants.dart';
import 'package:vcusines/notifier/food_notifier.dart';
import 'package:vcusines/screens/home_screens/components_homescreen/food_item.dart';
import 'package:vcusines/screens/home_screens/top10food/top10food.dart';
import 'package:vcusines/screens/home_screens/three_side_food/widget/top_delicious_three_side.dart';
import 'package:provider/provider.dart';

class BodyHomeScreen extends StatefulWidget {
  const BodyHomeScreen({key}) : super(key: key);

  @override
  _BodyHomeScreenState createState() => _BodyHomeScreenState();
}

class _BodyHomeScreenState extends State<BodyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier reccommendFoodNotifier = Provider.of<FoodNotifier>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // top 10 cuisines
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Top10Food(),
          ),
          // cuisines 3 side in Vietnam
          TopDeliciousThreeSide(),
          SizedBox(
            height: size.height * 0.03,
          ),
          // Recommend for you
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Món ăn cho bạn ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 20, right: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reccommendFoodNotifier.reccommendFoodList.length,
              itemBuilder: (BuildContext context, int index) {
                final i = reccommendFoodNotifier.reccommendFoodList[index];
                return FoodItem(
                  food: i,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
