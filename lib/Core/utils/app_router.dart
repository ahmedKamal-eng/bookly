import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/HomeView.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/search/presentaion/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manager/search_cubit/search_cubit.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel:state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) =>  BlocProvider(
            create: (context)=>SearchCubit(getIt.get<HomeRepoImpl>()),
            child: SearchView()),
      ),
    ],
  );
}
