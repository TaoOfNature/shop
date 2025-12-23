import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/usecase/home_usecase.dart';
import 'package:shop/presentation/bloc/home/home_event.dart';
import 'package:shop/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase _homeUsecase;
  HomeBloc(this._homeUsecase) : super(HomeState.loading()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        loading: (e) async {
          final result = await _homeUsecase.getBanner();
          emit(switch (result) {
            Success(data: final bannerList) => HomeState.success(bannerList),
            Failure(message: final msg) => HomeState.failure(msg),
          });
        },
      );
    });
  }
}
