import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news_app_clean_architecture/core/resources/data_state.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entities/article.dart';
import '../../../../domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
   on<GetArticlesEvent>(getArticlesEvent);
  }

  void getArticlesEvent(GetArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    
    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
       RemoteArticlesDone(dataState.data!) 
      );
    }
    
    if(dataState is DataFailed) {
      emit(
        RemoteArticlesError(dataState.error!)
      );
    }
  }
}
