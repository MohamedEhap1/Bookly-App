import 'dart:math';

import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_button_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.20),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 42,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating:
              bookModel.volumeInfo.averageRating ?? Random().nextDouble() * 5.0,
          count: bookModel.volumeInfo.ratingsCount ?? Random().nextInt(999),
        ),
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0),
          child: BooksButtonAction(
            bookModel: bookModel,
          ),
        ),
      ],
    );
  }
}
