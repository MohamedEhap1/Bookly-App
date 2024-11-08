import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(AssetsData.logo)),
          SizedBox(
            height: 4,
          ),
          Text(
            "Read free books",
            textAlign: TextAlign.center,
            style: TextStyle(letterSpacing: 8),
          )
        ],
      ),
    );
  }
}
