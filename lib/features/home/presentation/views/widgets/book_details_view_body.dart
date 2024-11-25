import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_button_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 10),
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.20),
                child: const CustomBookImage(),
              ),
              const SizedBox(
                height: 42,
              ),
              const Text(
                "The Jungle Book",
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 5,
              ),
              Opacity(
                opacity: .7,
                child: Text(
                  "Rudyard Kipling",
                  style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 37,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.0),
                child: BooksButtonAction(),
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "You can also like",
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SimilarBooksListView(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )),
      ],
    );
  }
}
