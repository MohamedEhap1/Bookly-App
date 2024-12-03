import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksButtonAction extends StatelessWidget {
  const BooksButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomButton(
          backgroundColor: Colors.white,
          color: Colors.black,
          text: "Free",
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        CustomButton(
          onPressed: () async {
            Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
            if (await canLaunchUrl(uri)) {
              launchUrl(uri);
            }
          },
          backgroundColor: const Color(0xffEF8262),
          color: Colors.white,
          text: "Preview",
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ],
    );
  }
}
