import 'package:flutter/material.dart';

import '../../data/model/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  final List<OnBoardingDetails> onBoarding;
  final int index;

  const PageViewItem({
    super.key,
    required this.onBoarding,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            onBoarding[index].image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
