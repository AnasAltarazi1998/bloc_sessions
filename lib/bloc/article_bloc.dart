import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sessions/models/article_model.dart';
import 'package:bloc_sessions/services/article_service.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial());
  ArticleService articleService = ArticleService();
  @override
  Stream<ArticleState> mapEventToState(
    ArticleEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield LoadingDataState();
      try {
        ArticlesResponse res = await articleService.fetchArticles();
        yield LoadedDataState(data: res);
      } catch (e) {
        yield ErrorState(messsage: e.toString());
      }
    }
  }
}
