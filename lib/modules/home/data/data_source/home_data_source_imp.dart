import '../../../../core/constants/apis_urls.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/app_response.dart';
import '../models/category_model.dart';
import 'home_data_source.dart';

class HomeDataSourceImp extends HomeDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    AppResponse response = await ApiServices().get(ApisUrls.getCategories);
    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
