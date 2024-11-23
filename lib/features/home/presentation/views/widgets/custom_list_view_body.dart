import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class FeatureListViewItem extends StatelessWidget {
  const FeatureListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(AssetsData.test),
          ),
        ),
      ),
    );
  }
}
