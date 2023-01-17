
import 'package:bookly/Features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../../../../Core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchBooksState>(
      builder: (context,state) {
        if(state is SearchBooksSuccess) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookModel: state.books[index],),
                // child: Text('data'),
              );
            },
            itemCount: state.books.length,
          );
        }
        else if(state is SearchBooksFailure)
        {
            return CustomErrorWidget(errMessage: state.errMessage,);
        }
        else if(state is SearchBooksLoading)
          {
            return const CustomLoadingIndicator();
          }
        else
          {
            return Center(child: Text('Search For Books'),);
          }
      }

    );
  }
}
