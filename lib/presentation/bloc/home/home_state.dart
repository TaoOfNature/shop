import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop/domain/entities/banner.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(List<Banner> bannerList) = _Success;
  const factory HomeState.failure(String msg) = _Failure;
}
