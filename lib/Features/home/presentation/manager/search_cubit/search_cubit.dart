


import 'package:bookly/Features/home/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class SearchCubit extends Cubit<SearchBooksState> {
  SearchCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;

  Future<void> searchForBooks(String term) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.searchForBooks(term: term);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}