part of 'remote_article_bloc.dart';

@immutable
sealed class RemoteArticleState extends Equatable{
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticlesInitial extends RemoteArticleState {
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article) : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioError error) : super(error: error);
}
