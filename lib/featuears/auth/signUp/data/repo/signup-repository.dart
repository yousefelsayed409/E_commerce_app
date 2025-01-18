import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/api_consumer.dart';
import 'package:ecommerceapp/core/api/end_ponits.dart';
import 'package:ecommerceapp/core/errors/faliuer.dart';
import 'package:ecommerceapp/core/function/upload_image_to_api.dart';
import 'package:ecommerceapp/featuears/auth/signIn/data/model/signin_model.dart';
import 'package:ecommerceapp/featuears/auth/signUp/data/model/signup_model.dart';
import 'package:image_picker/image_picker.dart';

class SignupRepository {
final ApiConsumer api;

  SignupRepository({required this.api});
  Future<Either<Failure, SignUpModel>> signUpR({
   required String name,
     required String phone,
      required String email,
     required String password,
       required XFile profilePic,
    }) async {
    try {
      var response = await api.post(
        EndPoint.signUp,
        data: {
           "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "image": await uploadImageToApi(profilePic),
        },
      );

      if (response['status'] == true) {
        var responseData = response;
        return Right(SignUpModel.fromJson(responseData));
      } else {
        return Left(ServerFailure(response['message'] ?? 'Oops, please try again.'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      } else {
        return left(ServerFailure('opps,try later'));
      }
    }
    
  
  }
}