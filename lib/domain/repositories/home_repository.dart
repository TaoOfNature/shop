import 'package:shop/domain/entities/banner.dart';
import 'package:shop/domain/entities/data_result.dart';

abstract class HomeRepository {
  Future<DataResult<List<Banner>>> getBanner();
}
