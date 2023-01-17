import 'package:bookly/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_error_widget.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<NewestBooksCubit,NewsetBooksState>(
        builder: (context,state) {

          if(state is NewsetBooksSuccess)
         {   return ListView.builder(
          shrinkWrap: true,

          physics:const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BestSellerListViewItem(bookModel: state.books[index] ,),
          );
    },
     itemCount: 6,
    );}
          else if(state is NewsetBooksFailure)
            {
              return CustomErrorWidget(errMessage: state.errMessage,);
            }
          else
            {
              return const CustomLoadingIndicator();
            }
        }
      );
  }
}
