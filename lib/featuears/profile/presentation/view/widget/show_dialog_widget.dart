import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/widgets/custom_nav.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:ecommerceapp/featuears/auth/signIn/presentation/view/sign_in_screen.dart';
import 'package:ecommerceapp/featuears/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Logout'.tr(context),
           style: TextStyle(
            fontSize: 20,
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.black
                                : Colors.black,
                                          ),

        ),
        const SizedBox(
          height: 15,
        ),
         Text(
          'Are sou sure you want  to log in ?'.tr(context),
          textAlign: TextAlign.center,
           style: TextStyle(
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.black
                                : Colors.black,
                                          ),
          
          // maxLines: 3,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(5),
                    // side: const BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                 CustomNavigation.navigateBack(context);
                },
                child: Text(
                  'Cancel'.tr(context),
                  style: AppStyles.textStyle16.copyWith(color: AppColors.black),

                ),
              ),
            ), 
            const Spacer(),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is LogOutSuccessState) {
                  showsnakbarwidget(context, 'LogOut Successfully', true);
                  CustomNavigation.navigateAndFinish(context, const SignInScreen());
                }
                if (state is LogOutFailureState) {
                  showsnakbarwidget(context, state.errorMessage, true);
                }
              },
              builder: (context, state) {
                return Expanded(
                  child: OutlinedButton(
                    // ignore: sort_child_properties_last
                    child: Text(
                      'Logout'.tr(context),
                      style:
AppStyles.textStyle16.copyWith(color: AppColors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(5),
                        // side: const BorderSide(width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await cubit.logOut();
                    },
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
