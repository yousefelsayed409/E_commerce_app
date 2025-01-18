import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/dio_consumer.dart';
import 'package:ecommerceapp/featuears/auth/signIn/data/respositories/login_repository.dart';
import 'package:ecommerceapp/featuears/auth/signIn/presentation/manger/cubit/auth_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthSignInCubit(LoginRepository(api: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
