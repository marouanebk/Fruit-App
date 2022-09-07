import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DefaultPageScreen extends StatefulWidget {
  const DefaultPageScreen({Key? key}) : super(key: key);

  @override
  State<DefaultPageScreen> createState() => _DefaultPageScreenState();
}

class _DefaultPageScreenState extends State<DefaultPageScreen> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.settings),
                title: ("Settings"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PageView(
      //   children: [],
      //   controller: pageController,
      //   onPageChanged: onPageChanged,
      // ),
      bottomNavigationBar: PersistentTabView(
        items : _navBarsItems(),
        
      ),
    );
  }
}
