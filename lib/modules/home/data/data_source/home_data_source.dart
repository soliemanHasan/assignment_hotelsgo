import '../models/category_model.dart';

abstract class HomeDataSource {
  Future<List<CategoryModel>> getCategories();
}
