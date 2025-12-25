import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/usecase/home_usecase.dart';
import 'package:shop/presentation/bloc/home/home_event.dart';
import 'package:shop/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<BannerData> _listBanner = List.empty();

  final HomeUsecase _homeUsecase;
  HomeBloc(this._homeUsecase) : super(HomeState.loading()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        loading: (e) async {
          final result = await _homeUsecase.getBanner();
          switch (result) {
            case Success(data: final bannerList):
              _listBanner = [..._listBanner, ...bannerList];
              emit(HomeState.success(_listBanner));
              break;
            case Failure(message: final msg):
              emit(HomeState.failure(msg, _listBanner)); // 失败时带上旧数据
              break;
          }
        },
      );
    });
  }
}
