import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/dio_consumer.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/app_color.dart';
import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/no_acount.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:ecommerceapp/featuears/auth/signIn/presentation/view/sign_in_screen.dart';
import 'package:ecommerceapp/featuears/auth/signUp/data/repo/signup-repository.dart';
import 'package:ecommerceapp/featuears/auth/signUp/presentation/manger/manger/auth_signup_cubit.dart';
import 'package:ecommerceapp/featuears/auth/signUp/presentation/view/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthSignUpCubit( SignupRepository(api: DioConsumer(dio:Dio()))),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: BlocConsumer<AuthSignUpCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccessState) {
                final cubit = context.read<AuthSignUpCubit>();

                    cubit.clearAllDataToSignUp();
             showsnakbarwidget(context, state.signUpModel!.message, true);
                    CashNetwork.insertTocash(
                        key: AppConst.creatAccount,
                        value: AppConst.creatAccount );


                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  } else if (state is RegisterFaliureState) {
                  showsnakbarwidget(context, state.errorMessage, true);

                    // showDialog(
                    //   context: context,
                    //   builder: (context) => AlertDialog(
                    //     content: Text(
                    //       state.errorMessage,
                    //       style: const TextStyle(color: AppColors.white),
                    //     ),
                    //     backgroundColor: AppColors.blue,
                    //   ),
                    // );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<AuthSignUpCubit>();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const Text("Register Account", style: headingStyle),
                        const SizedBox(height: 10),
                        const Text(
                          "Complete your details or continue \nwith social media",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.h),
                        const SignUpForm(),
                        SizedBox(height: 10.h),
                        state is RegisterLoadingState
                            ? const CustomLoadingWidget()
                            : DefaultButton(
                                text: "Register",
                                press: () {
                                  if (cubit.signUpFormKey.currentState!
                                      .validate()) {
                                    cubit.register(
                                      name: cubit.signUpName.text,
                                      phone: cubit.signUpPhoneNumber.text,
                                      email: cubit.signUpEmail.text,
                                      password: cubit.signUpPassword.text,
                                    );
                                  }
                                },
                              ),
                        SizedBox(height: 10.h),
                        const HaveAccountText(to: 'Sign In'),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
