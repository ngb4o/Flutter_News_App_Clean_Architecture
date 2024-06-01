import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_news_app_clean_architecture/injection_container.dart';

import 'config/theme/app_themes.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticlesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        home: DailyNews(),
      ),
    );
  }
}
