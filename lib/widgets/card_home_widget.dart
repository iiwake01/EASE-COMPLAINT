import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class CardHomeWidget extends BaseWidget {
  
  const CardHomeWidget( {
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    required this.thirdWidget,
    this.onPressedFirst,
    this.onPressedSecond,
    this.onPressedThird,
  } );

  final Widget? firstWidget, secondWidget, thirdWidget;
  final VoidCallback? onPressedFirst, onPressedSecond, onPressedThird;

  @override
  Widget build(BuildContext context) {
    //final double cardMargin = MediaQuery.of(context).size.width * 0.0;
    return Card (
      //margin: EdgeInsets.symmetric(horizontal: cardMargin),
      elevation: 1.0,
      shadowColor: Colors.greenAccent,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),  
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              ElevatedButton (
                style: ElevatedButton.styleFrom (
                  backgroundColor: Colors.green,
                  elevation: 1, 
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: onPressedFirst,
                child: firstWidget,
              ),
              ElevatedButton (
                style: ElevatedButton.styleFrom (
                  backgroundColor: Colors.green,
                  elevation: 1, 
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: onPressedSecond,
                child: secondWidget
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
          ElevatedButton (
            style: ElevatedButton.styleFrom (
              backgroundColor: Colors.green,
              elevation: 1, 
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder( borderRadius: BorderRadiusDirectional.circular(10)),
              textStyle: const TextStyle(fontSize: 20)
            ),
            onPressed: onPressedThird,
            child: thirdWidget,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),            
        ],
      ),
    );
  }
}