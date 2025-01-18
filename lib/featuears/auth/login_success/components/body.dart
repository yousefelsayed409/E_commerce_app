import 'package:ecommerceapp/core/widgets/custom_nav.dart';
import 'package:ecommerceapp/featuears/Layout/widget/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/defult_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25.h),
        Image.asset("assets/images/success.png", height: 250.h),
        SizedBox(height: 60.h),
        Text("Login Success", style: AppStyles.textStyle30),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.h),
          child: SizedBox(
            width: double.infinity,
            child: DefaultButton(
              text: "Back to home",
              press: () {
                //////////////////////!
                CustomNavigation.navigateAndFinish(context, const HomeNavBarWidget3());
              },
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
