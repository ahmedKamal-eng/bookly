import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'book_action.dart';
import 'book_details_section.dart';
import 'booking_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
   BookDetailsViewBody({Key? key,required this.bookModel}) : super(key: key);
  BookModel bookModel;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsSection(bookModel: bookModel,),
                const Expanded(
                  child:  SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBookSection()
              ],
            ),
          ) ,
        ),
      ],
    );
  }
}
