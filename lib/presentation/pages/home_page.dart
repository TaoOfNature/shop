import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SliverToBoxAdapter(child: CarouselSlider(items: items, options: options),),
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
      ),
    );
  }
}
