import 'package:app/utils/constants.dart';
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class CardHomeWidget extends BaseWidget {
  const CardHomeWidget({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    required this.thirdWidget,
    this.onPressedFirst,
    this.onPressedSecond,
    this.onPressedThird,
  });

  final Widget? firstWidget, secondWidget, thirdWidget;
  final VoidCallback? onPressedFirst, onPressedSecond, onPressedThird;

  @override
  Widget build(BuildContext context) {
    //final double cardMargin = MediaQuery.of(context).size.width * 0.0;
    return Card(
      color: Color.fromARGB(236, 201, 221, 203),
      //margin: EdgeInsets.symmetric(horizontal: cardMargin),
      elevation: 1.0,
      shadowColor: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HomePageButton(
                    onPressedFirst: onPressedFirst, firstWidget: firstWidget),
                HomePageButton(
                    onPressedFirst: onPressedSecond, firstWidget: secondWidget)
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          HomePageButton(
              onPressedFirst: onPressedThird, firstWidget: thirdWidget),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
        ],
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  const HomePageButton({
    super.key,
    required this.onPressedFirst,
    required this.firstWidget,
  });

  final VoidCallback? onPressedFirst;
  final Widget? firstWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .25,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constants.standardColor,
            elevation: 1,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(40)),
            textStyle: const TextStyle(fontSize: 20)),
        onPressed: onPressedFirst,
        child: firstWidget,
      ),
    );
  }
}
