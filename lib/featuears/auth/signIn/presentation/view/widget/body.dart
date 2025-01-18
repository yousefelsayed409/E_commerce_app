import 'package:ecommerceapp/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerceapp/core/widgets/defult_button.dart';
import 'package:ecommerceapp/core/widgets/keyboar_Util.dart';
import 'package:ecommerceapp/core/widgets/snakbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/no_acount.dart';
import '../../../../../../core/widgets/socal_card.dart';
import '../../../../login_success/login_success_screen.dart';
import '../../manger/cubit/auth_login_cubit.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
            final cubit = context.read<AuthSignInCubit>();

    return BlocConsumer<AuthSignInCubit, AuthLoginState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          // showsnakbarwidget(context, state.signInModel!.message, true);
          cubit.clearAllDataToSignin();
    showsnakbarwidget(context,'SuccessFully LogIn', true);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginSuccessScreen()),
          );
        } else if (state is AuthLoginFailureState) {
            showsnakbarwidget(context, state.errorMessage, false);
         
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthSignInCubit>();

        return SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    const SizedBox(height: 7),
                    Text("Welcome Back!", style: AppStyles.textStyle28),
                    SizedBox(height: 12.h),
                    const Text(
                      "Sign in with your email and password\nor continue with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 35.h),
                    const SignForm(),
                    SizedBox(height: 20.h),
                    if (state is AuthLoginLoadingState)
                      const CustomLoadingWidget()
                    else
                      DefaultButton(
                        text: "Login",
                        press: () {
                          if (cubit.signInFormKey.currentState!.validate()) {
                            KeyboardUtil.hideKeyboard(context);
                            cubit.signInR(
                              email: cubit.signInEmail.text,
                              password: cubit.signInPassword.text,
                            );
                          }
                        },
                      ),
                    SizedBox(height: 20.h),
                    const SocialCardWidget(),
                    SizedBox(height: 20.h),
                    const DontHaveAccountText(to: ' SignUp'),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
