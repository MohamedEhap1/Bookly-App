import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
