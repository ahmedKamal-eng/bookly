
import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
 Future<Either<Failure,List<BookModel>>> searchForBooks({required String term});
}