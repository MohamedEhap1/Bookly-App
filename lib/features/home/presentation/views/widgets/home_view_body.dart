import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 29.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  FeaturesBooksListView(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Newest Books",
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          //!Expand & shouldn't use shrinkWrap in listView as it load all items if true
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
