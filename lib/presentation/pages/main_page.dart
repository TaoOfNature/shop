import 'package:flutter/material.dart';
import 'package:shop/gen/app_localizations.dart';
import 'package:shop/presentation/pages/cart_page.dart';
import 'package:shop/presentation/pages/home_page.dart';
import 'package:shop/presentation/pages/mine_page.dart';
import 'package:shop/presentation/pages/video_page.dart';
import 'package:shop/presentation/widgets/lazy_indexed_stack.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyIndexedStack(
        index: _currentIndex,
        children: [HomePage(), VideoPage(), CartPage(), MinePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: Color(0xFFFF5000),
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_rounded),
            label: AppLocalizations.of(context)!.video,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: AppLocalizations.of(context)!.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: AppLocalizations.of(context)!.mine,
          ),
        ],
      ),
    );
  }
}
