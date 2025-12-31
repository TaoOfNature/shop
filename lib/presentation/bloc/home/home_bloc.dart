import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/domain/entities/banner_data.dart';
import 'package:shop/domain/entities/category_data.dart';
import 'package:shop/domain/entities/data_result.dart';
import 'package:shop/domain/entities/product_data.dart';
import 'package:shop/domain/usecase/home_usecase.dart';
import 'package:shop/presentation/bloc/home/home_event.dart';
import 'package:shop/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<BannerData> _listBanner = List.empty();
  List<CategoryData> _listCategory = List.empty();
  List<ProductData> _listProduct = List.empty();

  final HomeUsecase _homeUsecase;
  HomeBloc(this._homeUsecase) : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) {
      _fetchBanners(emit);
      _fetchCategory(emit);
      _fetchProduct(emit);
    });
  }
  Future<void> _fetchBanners(Emitter<HomeState> emit) async {
    final result = await _homeUsecase.getBanner();
    switch (result) {
      case Success(data: final bannerList):
        _listBanner = [..._listBanner, ...bannerList];
        emit(state.copyWith(bannerList: _listBanner, isLoadingBanner: false));
        break;
      case Failure(message: final msg):
        emit(state.copyWith(isLoadingBanner: false, errorMessage: msg));
        break;
    }
  }

  Future<void> _fetchCategory(Emitter<HomeState> emit) async {
    final result = await _homeUsecase.getCategory();
    switch (result) {
      case Success(data: final categoryList):
        _listCategory = [..._listCategory, ...categoryList];
        emit(
          state.copyWith(isLoadingCategory: false, categoryList: _listCategory),
        );
        break;
      case Failure(message: final msg):
        emit(state.copyWith(isLoadingCategory: false, errorMessage: msg));
        break;
    }
  }

  Future<void> _fetchProduct(Emitter<HomeState> emit) async {
    final result = await _homeUsecase.getProduct();
    switch (result) {
      case Success(data: final list):
        _listProduct = [..._listProduct, ...list];
        emit(
          state.copyWith(productList: _listProduct, isLoadingProduct: false),
        );
        break;
      case Failure(message: final msg):
        emit(state.copyWith(errorMessage: msg, isLoadingProduct: false));
        break;
    }
  }
}
