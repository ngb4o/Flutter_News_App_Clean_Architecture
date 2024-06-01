part of 'remote_article_bloc.dart';

@immutable
sealed class RemoteArticleEvent {
  const RemoteArticleEvent();
}

class GetArticlesEvent extends RemoteArticleEvent {
  const GetArticlesEvent();
}
