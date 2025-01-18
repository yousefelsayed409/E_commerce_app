
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/api/end_ponits.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = CashNetwork.getCashData(key: ApiKey.token) != null ? CashNetwork.getCashData(key: ApiKey.token) : null;
        // CacheHelper().getData(key: ApiKey.token) != null
        //     : null;
    super.onRequest(options, handler);
  }
}
