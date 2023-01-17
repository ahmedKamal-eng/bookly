
import 'package:bookly/Core/widgets/custom_error_widget.dart';
import 'package:bookly/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
   SimilarBooksListView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(

      builder: (context,state) {
        if(state is SimilarBooksSuccess)
          {
         return SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? ''
                      ,),
                );

              }),
        );}
        else if(state is SimilarBooksFailure)
          {
            return CustomErrorWidget(errMessage: state.errMessage);
          }
        else
          {
            return CustomLoadingIndicator();
          }
      }
    );
  }
}

