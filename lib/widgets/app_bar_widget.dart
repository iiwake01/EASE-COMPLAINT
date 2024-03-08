
import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends BaseWidget implements PreferredSizeWidget {

  const AppBarWidget ( {
    super.key,
required this.child,
    this.height = kToolbarHeight,
      } );

final Widget child;
  final double height;
  
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.green,
      child: child,
    );
  }  
}