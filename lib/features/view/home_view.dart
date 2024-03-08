import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:twitter_clone/constants/assets_constants.dart';
import 'package:twitter_clone/constants/ui_constants.dart';

import '../../theme/pallete.dart';

class HomeView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _page = 0;
  final appBar = UIConstants.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.homeFilledIcon,
              color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.searchIcon,
              color: Pallete.whiteColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsConstants.notifFilledIcon,
              color: Pallete.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
