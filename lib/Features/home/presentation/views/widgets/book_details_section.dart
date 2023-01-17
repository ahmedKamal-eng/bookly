
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'book_action.dart';
import 'booking_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
   BookDetailsSection({Key? key,required this.bookModel}) : super(key: key);
   BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;


    return Column(
      children: [
        CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .20),
          child: CustomBookImage(imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.textStyle18.copyWith(
              color: Color(0xff707070),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        BookingRating(
           rating: bookModel.volumeInfo.averageRating?.toInt() ?? 0,
          count: bookModel.volumeInfo.ratingsCount ??0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(),

      ],
    );
  }
}
