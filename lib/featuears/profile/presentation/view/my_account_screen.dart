import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/localization/localization.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:ecommerceapp/core/widgets/custom_suffixe_icon.dart';
import 'package:ecommerceapp/featuears/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:ecommerceapp/featuears/profile/presentation/view/update_data_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/defult_button.dart';
import 'change_password_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        final theme = Theme.of(context);    
        
        if (cubit.userModel == null) cubit.getUserData();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: CashNetwork.getCashData(key: 'theme') == 'light'
              ? AppColors.Teal
              : Colors.black,
            leading: Padding(
              padding: const EdgeInsets.all(18),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/images/Back ICon.svg',
                  color: AppColors.white,
                  width: 22,
                ),
              ),
            ),
            title: Text(
              "My Account".tr(context),
              style: TextStyle(
                fontSize: 18,
                                            color:  CashNetwork.getCashData(key: 'theme') == 'light'
                                ? Colors.white
                                : Colors.white,
                                          ),
            ),
          ),
          body: cubit.userModel != null
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(cubit.userModel!.image!),
                          radius: 45,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          cubit.userModel!.name!,
                          style: theme.textTheme.headlineMedium,),
                        const SizedBox(height: 10),
                        Text(
                          cubit.userModel!.email!,
                          style: theme.textTheme.bodyLarge, 
                        ), 
//                          Text(
//   cubit.userModel!.id?.toString() ?? 'Unknown ID', 
//   style: theme.textTheme.bodyLarge,
// ),
                        const SizedBox(height: 30),
                        DefaultButton(
                          text: "Change Password".tr(context),
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen()),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        DefaultButton(
                          text: "Update Data".tr(context),
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateDataScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CupertinoActivityIndicator(),
                ),
        );
      },
    );
  }
}
