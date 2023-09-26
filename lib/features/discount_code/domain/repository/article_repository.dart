import 'package:discountcodes/core/resources/data_state.dart';
import 'package:discountcodes/features/discount_code/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}