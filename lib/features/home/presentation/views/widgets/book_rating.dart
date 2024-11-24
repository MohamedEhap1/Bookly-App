import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.solidStar,
            size: 18,
            color: Color(0xffFFDD4F),
          ),
          const SizedBox(
            width: 6.3,
          ),
          const Text(
            '4.8',
            style: Styles.textStyle16,
          ),
          const SizedBox(
            width: 6.3,
          ),
          Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
