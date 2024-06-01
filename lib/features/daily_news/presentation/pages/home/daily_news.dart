import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_clean_architecture/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        'Daily News',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if(state is RemoteArticlesLoading) {
          return Center(child: CircularProgressIndicator(),);
        } else if (state is RemoteArticlesError) {
          return Center(child: Icon(Icons.refresh),);
        } else if(state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
