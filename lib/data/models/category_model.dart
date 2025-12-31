import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/category_data.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String icon,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  CategoryData toEntity() => CategoryData(id: id, name: name, icon: icon);
}
