import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/bmi/data/data_sources/remote/news_api_service.dart';
import 'features/bmi/data/repository/article_repository_impl.dart';
import 'features/bmi/domain/repository/article_repository.dart';
import 'features/bmi/domain/usecases/get_article.dart';
import 'features/bmi/presentation/bloc/article/remote/remote_article_bloc.dart';



final sl = GetIt.instance;


Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
          ()=> RemoteArticlesBloc(sl())
  );
}