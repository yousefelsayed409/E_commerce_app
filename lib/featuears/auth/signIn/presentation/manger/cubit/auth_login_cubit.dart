
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/dio_consumer.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/core/utils/constants.dart';
import 'package:ecommerceapp/featuears/auth/signIn/data/model/signin_model.dart';
import 'package:ecommerceapp/featuears/auth/signIn/data/respositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

part 'auth_login_state.dart';

class AuthSignInCubit extends Cubit<AuthLoginState> {
  AuthSignInCubit( this.userRepository ) : super(AuthLoginInitial());
      
      DioConsumer api = DioConsumer(dio: Dio());
    final LoginRepository userRepository ;
    
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
 //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
      
      Future<void> signInR({required String email, required String password}) async {
    emit(AuthLoginLoadingState());
    final result = await userRepository.signIn(email: email, password: password);
      await CashNetwork.insertTocash(key: 'password', value: signInPassword.text);
       currenpassword = CashNetwork.getCashData(key: 'password');
    result.fold(
      (failure) => emit(AuthLoginFailureState(errorMessage: failure.message)),
      (signInModel) => emit(AuthLoginSuccessState(signInModel: signInModel)),
    );
  }

  

  void login() async {
    emit(AuthLoginLoadingState());
    try {
      http.Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {'email': signInEmail.text, "password": signInPassword.text}
          );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          debugPrint('User login Success: $data');

          String token = data['data']['token'];
          await CashNetwork.insertTocash(key: 'token', value: token);
          await CashNetwork.insertTocash(key: 'password', value: signInPassword.text);
          currenpassword = CashNetwork.getCashData(key: 'password');

          debugPrint('Token: $token');
          
          emit(AuthLoginSuccessState());
          
        } else {
          debugPrint(' Failed To Login ${data['message']}');
          emit(AuthLoginFailureState(errorMessage: data['message']));
        }
      }
    } on Exception catch (e) {
      emit(AuthLoginFailureState(errorMessage: e.toString()));
    }
  }
   
   void clearAllDataToSignin(){
    signInEmail.text = '' ;
    signInPassword.text = '';
   }
//    Future<void> signIn() async {
//   emit(AuthLoginLoadingState());
//   try {
//     var response = await api.post(
//       isFromData: true,
//       EndPoint.login,
//       data: {
//         "email": signInEmail.text,
//         "password": signInPassword.text,
//       },
//     );

//     var responseData = response['data']; 

//     if (response['status'] == 'true') {
//       emit(AuthLoginSuccessState(signInModel: SignInModel.fromJson(responseData)));
//     } else {
//       emit(AuthLoginFailureState(errorMessage: response['message'] ?? 'Oops , Please try again'));
//     }
//   } on ServerException catch (e) {
//     emit(AuthLoginFailureState(errorMessage: e.errModel.message));
//   } catch (e) {
//     emit(AuthLoginFailureState(errorMessage: e.toString()));
//   }
// } 





}
