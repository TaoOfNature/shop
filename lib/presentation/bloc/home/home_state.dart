import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/category_data.dart';
import 'package:shop/domain/entities/product_data.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<BannerData> bannerList,
    @Default([]) List<CategoryData> categoryList,
    @Default([]) List<ProductData> productList,

    @Default(false) bool isLoadingBanner,
    @Default(false) bool isLoadingCategory,
    @Default(false) bool isLoadingProduct,
    String? errorMessage,
  }) = _HomeState;
  factory HomeState.initial() => const HomeState(
    isLoadingBanner: true,
    isLoadingCategory: true,
    isLoadingProduct: true,
  );
}
