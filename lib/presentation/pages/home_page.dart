import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/presentation/bloc/home/home_bloc.dart';
import 'package:shop/presentation/bloc/home/home_event.dart';
import 'package:shop/presentation/bloc/home/home_state.dart';
import 'package:shop/presentation/widgets/images/app_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeEvent.loading());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [_buildBanner(), _buildCategory(), _buildProduct()],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isLoadingBanner != current.isLoadingBanner,
      builder: (context, state) {
        if (state.isLoadingBanner) {
          return SliverToBoxAdapter(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(height: 200, color: Colors.white),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.h, // 使用 ScreenUtil 适配高度
                aspectRatio: 16 / 9, // 也可以设置比例
                viewportFraction: 0.8, // 当前页占据屏幕宽度的比例（0.8 可以看到左右两边一点点）
                initialPage: 0,
                enableInfiniteScroll: true, // 【关键】开启无限轮播，默认为 true
                reverse: false,
                autoPlay: true, // 【关键】开启自动播放
                autoPlayInterval: const Duration(seconds: 3), // 播放间隔
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true, // 【关键】中间页面放大效果，提升高级感
                scrollDirection: Axis.horizontal,
              ),
              items: state.bannerList.map((bannerData) {
                return AppImage(url: bannerData.imageUrl,);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildCategory() {
    // SliverPersistentHeader(delegate: null),
    return Placeholder();
  }

  Widget _buildProduct() {
    SliverPadding(
      padding: EdgeInsets.all(10),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Placeholder();
        },
      ),
    );
    return Placeholder();
  }
}
