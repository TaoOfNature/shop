import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/banner_data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(List<BannerData> bannerList) = _Success;
  const factory HomeState.failure(String msg, List<BannerData> bannerList) = _Failure;
}
