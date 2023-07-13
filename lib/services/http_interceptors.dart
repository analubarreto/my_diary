import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) {
   print(data.toString());
   return Future.value(data);
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) {
    print(data.toString());
    return Future.value(data);
  }
  
}