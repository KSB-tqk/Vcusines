import 'package:flutter/material.dart';
import 'package:vcusines/components/constants.dart';
import 'package:vcusines/notifier/food_notifier.dart';
import 'package:vcusines/screens/home_screens/components_homescreen/food_item.dart';
import 'package:provider/provider.dart';

class TopMiddleFood extends StatelessWidget {
  static String id = 'MiddleFood';
  const TopMiddleFood({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodNotifier topMiddleFoodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
          'Ẩm thực miền Trung!',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: ListView.builder(
          itemCount: topMiddleFoodNotifier.middleFoodList.length,
          itemBuilder: (BuildContext context, int index) {
            final i = topMiddleFoodNotifier.middleFoodList[index];
            return FoodItem(
              food: i,
            );
          },
        ),
      ),
    );
  }
}
