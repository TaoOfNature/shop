import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data.freezed.dart';

@freezed
sealed class CategoryData with _$CategoryData {
  const factory CategoryData({
    required String id,
    required String name,
    required String icon,
  }) = _CategoryData;

}
