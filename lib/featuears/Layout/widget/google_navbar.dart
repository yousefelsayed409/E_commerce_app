//   import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:ecommerceapp/core/utils/app_color.dart';
// import 'package:ecommerceapp/featuears/Favorite/presentation/view/favorite_screen.dart';
// import 'package:ecommerceapp/featuears/cart/Cart_screen.dart';
// import 'package:ecommerceapp/featuears/profile/presentation/view/profile_screen.dart';
// import 'package:ecommerceapp/featuears/home/presentation/view/widget/home_body.dart';

// class GoogleNavBar extends StatefulWidget {
//   const GoogleNavBar({super.key});

//   @override
//   State<GoogleNavBar> createState() => _GoogleNavBarState();
// }

// class _GoogleNavBarState extends State<GoogleNavBar> {
//   int _tabIndex = 0;
//   late PageController pageController;

//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(initialPage: _tabIndex);
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isRTL = Directionality.of(context) == TextDirection.rtl;

//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Container(

//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: GNav(
//           tabBackgroundGradient:  LinearGradient(
//             colors: [AppColors.Teal.withOpacity(0.1), AppColors.Teal.withOpacity(0.1)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           tabActiveBorder:  Border.all(color: AppColors.Teal, width: 2),
//           selectedIndex: _tabIndex,
//           onTabChange: (index) {
//             setState(() {
//               _tabIndex = index;
//               pageController.jumpToPage(isRTL ? 3 - index : index);
//             });
//           },
//           rippleColor: AppColors.Teal.withOpacity(0.2),
//           hoverColor: AppColors.Teal.withOpacity(0.1),
//           gap: 8,
//           activeColor: AppColors.Teal,
//           iconSize: 24,
          
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           duration: const Duration(milliseconds: 300),
//           tabBackgroundColor: AppColors.Teal.withOpacity(0.2),
//           color: Colors.grey,
//           tabs: isRTL
//               ? const [
//                   GButton(
//                     icon: LineIcons.user,
//                     text: 'Profile',
//                   ),
//                   GButton(
//                     icon: LineIcons.shoppingBag,
//                     text: 'Cart',
//                   ),
//                   GButton(
//                     icon: LineIcons.heart,
//                     text: 'Favorite',
//                   ),
//                   GButton(
//                     icon: LineIcons.home,
//                     text: 'Home',
//                   ),
//                 ]
//               : const [
//                   GButton(
//                     icon: LineIcons.home,
//                     text: 'Home',
//                   ),
//                   GButton(
//                     icon: LineIcons.heart,
//                     text: 'Favorite',
//                   ),
//                   GButton(
//                     icon: LineIcons.shoppingBag,
//                     text: 'Cart',
//                   ),
//                   GButton(
//                     icon: LineIcons.user,
//                     text: 'Profile',
//                   ),
//                 ],
//         ),
//       ),
//       body: PageView(
//         controller: pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _tabIndex = index;
//           });
//         },
//         children: isRTL
//             ? const [
//                 ProfileScreen(),
//                 CartScreen(),
//                 FavoriteScreen(),
//                 HomeBody(),
//               ]
//             : const [
//                 HomeBody(),
//                 FavoriteScreen(),
//                 CartScreen(),
//                 ProfileScreen(),
//               ],
//       ),
//     );
//   }
// }
