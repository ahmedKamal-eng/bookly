


import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState>
{
  SimilarBooksCubit(this.homeRepo):super(SimilarBooksInitial());

  late HomeRepo homeRepo;

  Future<void> fetchSimilarBooks(String? category) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category ?? 'computer');
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }

}