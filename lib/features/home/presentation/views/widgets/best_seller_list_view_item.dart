import 'dart:math';

import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kBookDetails, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              width: 29,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kMarmeladFont),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  FittedBox(
                    child: Text(bookModel.volumeInfo.authors![0],
                        style: Styles.textStyle14.copyWith(
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          "Free",
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Flexible(
                        child: BookRating(
                          rating: bookModel.volumeInfo.averageRating ??
                              Random().nextInt(5),
                          count: bookModel.volumeInfo.ratingsCount ??
                              Random().nextInt(999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
