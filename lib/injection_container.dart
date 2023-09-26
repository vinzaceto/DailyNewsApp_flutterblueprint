import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/discount_code/data/data_sources/remote/news_api_service.dart';
import 'features/discount_code/data/repository/article_repository_impl.dart';
import 'features/discount_code/domain/repository/article_repository.dart';
import 'features/discount_code/domain/usecases/get_article.dart';
import 'features/discount_code/presentation/bloc/article/remote/remote_article_bloc.dart';



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