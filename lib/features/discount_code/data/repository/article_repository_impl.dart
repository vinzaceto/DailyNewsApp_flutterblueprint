import 'dart:io';

import 'package:dio/dio.dart';
import 'package:bmi/core/constants/constants.dart';
import 'package:bmi/core/resources/data_state.dart';
import 'package:bmi/features/discount_code/data/data_sources/remote/news_api_service.dart';
import 'package:bmi/features/discount_code/domain/entities/article.dart';
import 'package:bmi/features/discount_code/domain/repository/article_repository.dart';

import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey:newsAPIKey,
        country:countryQuery,
        category:categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

}