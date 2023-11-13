import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domin/entities/category_entity.dart';
import '../../domin/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImp(this.homeDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return ErrorsHandler.handleEither(() => homeDataSource.getCategories());
  }
}
