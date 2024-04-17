import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewWidget extends BaseWidget {
  const PageViewWidget({
    super.key,
    this.canScroll,
    required this.pageController,
    required this.isLoading,
    required this.widgets,
  });

  final bool? canScroll;
  final PageController pageController;
  final RxBool isLoading;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (isLoading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return PageView(
            controller: pageController,
            physics: canScroll == true
                ? const ClampingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            //scrollDirection: Axis.horizontal,
            children: widgets,
          );
        }
      },
    );
  }
}
