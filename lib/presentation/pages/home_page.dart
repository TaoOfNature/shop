import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop/presentation/bloc/home/home_bloc.dart';
import 'package:shop/presentation/bloc/home/home_event.dart';
import 'package:shop/presentation/bloc/home/home_state.dart';

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
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          return _buildWidget();
        },
        listener: (BuildContext context, HomeState state) {
          state.maybeWhen(
            success: (list) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("get success ")));
            },
            failure: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
      ),
    );
  }

  SafeArea _buildWidget() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            // child: CarouselSlider(items: items, options: options),
          ),
          // SliverPersistentHeader(delegate: null),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: MasonryGridView.count(
              crossAxisCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Placeholder();
              },
            ),
          ),
        ],
      ),
    );
  }
}
