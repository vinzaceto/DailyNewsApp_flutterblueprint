import 'package:bmi/core/resources/data_state.dart';
import 'package:bmi/features/discount_code/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}