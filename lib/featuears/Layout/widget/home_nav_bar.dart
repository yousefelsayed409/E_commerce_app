import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/featuears/Favorite/presentation/view/favorite_screen.dart';
import 'package:ecommerceapp/featuears/cart/Cart_screen.dart';
import 'package:ecommerceapp/featuears/profile/presentation/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ecommerceapp/featuears/home/presentation/view/widget/home_body.dart';




class HomeNavBarWidget3 extends StatefulWidget {
  const HomeNavBarWidget3({super.key});
  
  @override
  State<HomeNavBarWidget3> createState() => _HomeNavBarWidget3State();
}

class _HomeNavBarWidget3State extends State<HomeNavBarWidget3>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }


@override
Widget build(BuildContext context) {
  bool isRTL = Directionality.of(context) == TextDirection.rtl;
  bool isLTr = Directionality.of(context) == TextDirection.ltr;


  return Scaffold(
    extendBody: true,
    bottomNavigationBar: CircleNavBar(
      circleShadowColor: AppColors.Teal,
      activeIcons: isRTL
          ? const [
              Icon(LineIcons.user, color: AppColors.Teal),
              Icon(LineIcons.shoppingBag, color: AppColors.Teal),
              Icon(LineIcons.heart, color: AppColors.Teal),
              Icon(LineIcons.home, color: AppColors.Teal),
            ]
          : const [
              Icon(LineIcons.home, color: AppColors.Teal),
              Icon(LineIcons.heart, color: AppColors.Teal),
              Icon(LineIcons.shoppingBag, color: AppColors.Teal),
              Icon(LineIcons.user, color: AppColors.Teal),
            ],
      inactiveIcons: isLTr
          ? const [
              Icon(LineIcons.user, color: Colors.grey),
              Icon(LineIcons.shoppingBag, color: Colors.grey),
              Icon(LineIcons.heart, color: Colors.grey),
              Icon(LineIcons.home, color: Colors.grey),
            ]
          : const [
              Icon(LineIcons.home, color: Colors.grey),
              Icon(LineIcons.heart, color: Colors.grey),
              Icon(LineIcons.shoppingBag, color: Colors.grey),
              Icon(LineIcons.user, color: Colors.grey),
            ],
      color: Colors.white,
      height: 50,
      circleWidth: 50,
      activeIndex: _tabIndex,
      onTap: (index) {
        setState(() {
          _tabIndex = index;
          pageController.jumpToPage(isRTL ? 3 - index : index); 
          
        });
      },
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      shadowColor: AppColors.Teal,
      elevation: 10,
    ),
    body: PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
      children: isRTL
          ? const [
              ProfileScreen(),
              CartScreen(),
              FavoriteScreen(),
              HomeBody(),
            ]
          : const [
              HomeBody(),
              FavoriteScreen(),
              CartScreen(),
              ProfileScreen(),
            ],
    ),
  );
}
    }