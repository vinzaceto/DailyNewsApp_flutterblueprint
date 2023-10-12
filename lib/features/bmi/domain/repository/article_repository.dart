import 'package:bmi/core/resources/data_state.dart';
import 'package:bmi/features/bmi/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}