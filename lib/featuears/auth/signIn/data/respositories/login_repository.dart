import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/api_consumer.dart';
import 'package:ecommerceapp/core/api/end_ponits.dart';
import 'package:ecommerceapp/core/errors/faliuer.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/featuears/auth/signIn/data/model/signin_model.dart';

class LoginRepository {
  final ApiConsumer api;

  LoginRepository({required this.api});

  Future<Either<Failure, SignInModel>> signIn({
    required String email,
     required String password}) async {
    try {
      var response = await api.post(
        EndPoint.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response['status'] == true) {
        var responseData = response['data'];
      
        await CashNetwork.insertTocash(key: 'token', value: response['data']['token']);
        return Right(SignInModel.fromJson(responseData));
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
