import 'package:bmi/core/resources/data_state.dart';
import 'package:bmi/core/usecases/usecase.dart';
import 'package:bmi/features/discount_code/domain/entities/article.dart';

import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
  
}