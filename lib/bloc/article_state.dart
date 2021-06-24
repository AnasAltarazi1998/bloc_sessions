part of 'article_bloc.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class LoadedDataState extends ArticleState {
  ArticlesResponse data;
  LoadedDataState({this.data});
}

class LoadingDataState extends ArticleState {}

class ErrorState extends ArticleState {
  String messsage;
  ErrorState({this.messsage});
}
