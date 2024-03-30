import 'package:app/widgets/base_widgets.dart';
import 'package:flutter/material.dart';

class TopComplaintsText extends BaseWidget {

  const TopComplaintsText({
    super.key,
    required this.iteration,
    required this.data,
  });

  final String iteration;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row (
        children: [
          Text(
            iteration,
            style: const TextStyle (
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox (
            width: 40,
          ),
          Container (
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: Colors.white,
                ),
                child: Text(
                  data,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}