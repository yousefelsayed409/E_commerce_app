import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/function/upload_image_to_api.dart';
import 'package:ecommerceapp/featuears/auth/signUp/data/model/signup_model.dart';
import 'package:ecommerceapp/featuears/auth/signUp/data/repo/signup-repository.dart';
import 'package:ecommerceapp/featuears/auth/signUp/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_signup_state.dart';

class AuthSignUpCubit extends Cubit<AuthState> {
  AuthSignUpCubit(this.signupRepository) : super(AuthInitial()); 
 
 final SignupRepository signupRepository ;
//Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
 //Sign up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

//  static AuthSignUpCubit get(context) => BlocProvider.of(context);

void uploadProfilePic(XFile? image) {
    if (image != null) {
      profilePic = image;
      emit(UpLoadImageState());
    } else {
      emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
    }
  }

  Future<void> register({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    if (profilePic == null) {
      emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
      return;
    }

    emit(RegisterLoadingState());

    final result = await signupRepository.signUpR(
      name: name,
      phone: phone,
      email: email,
      password: password,
      profilePic: profilePic!,
    );

    result.fold(
      (failure) => (RegisterFaliureState(errorMessage: failure.message)),
      (signUpModel) => emit(RegisterSuccessState(  signUpModel)),
    );
  } 

 void clearAllDataToSignUp(){
    signUpName.text = '' ;
    signUpEmail.text = '';
    signUpPhoneNumber.text ='';
    signUpPassword.text = ''; 

   }
  // void uploadProfilePic(XFile? image) {
//   if (image != null) {
//     profilePic = image;
//     emit(UpLoadImageState());
//   } else {
//     emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
//   }
// }

//   void register() async {
//   if (profilePic == null) {
//     emit(RegisterFaliureState(errorMessage: "يرجى اختيار صورة شخصية"));
//     return;
//   }
      
//   emit(RegisterLoadingState());
//   try {
//     final imageUrl = await uploadImageToApi(profilePic!);
//     final response = await http.post(
//       Uri.parse('https://student.valuxapps.com/api/register'),
//       body: {
//         "name": signUpName.text,
//         "email": signUpEmail.text,
//         "phone": signUpPhoneNumber.text,
//         "password": signUpPassword.text,
//         "image": '',
//       },
//     );

//     final responseBody = jsonDecode(response.body);
//     if (responseBody['status'] == true) {
//       emit(RegisterSuccessState());
//     } else {
//       emit(RegisterFaliureState(errorMessage: responseBody["message"]));
//     }
//   } catch (e) {
//     emit(RegisterFaliureState(errorMessage: "حدث خطأ أثناء الاتصال بالخادم"));
//   }
// } 

}
