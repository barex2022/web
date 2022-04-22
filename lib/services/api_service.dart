import 'package:barex_website/services/debugger_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api/api_urls.dart';


class ApiService {
  static const String AUTHKEY = "Authorization";
  static final ApiService _apiService = ApiService._();
  late Dio _dio;
  late BaseOptions _baseOptions;



  static ApiService getInstance() {
    return _apiService;
  }
  /// [private] means api will require bearer/token to make add in header
  Future<Response?> makeGetRequest(String path,{Map<String,dynamic>? params,bool private = false}) async {
    if(private){
      String token = await _onAuthToken();
      _baseOptions.headers.addAll({AUTHKEY:token});
    }else {
      _baseOptions.headers.remove(AUTHKEY);
    }
    try{
      return _dio.get(path,queryParameters: params);
    }catch(e){
      DebugLogger.getInstance().logE("Error while making a get request $e");
    }


    return null;
  }

  /// onAuthToken can be useful whil generating authetication token for private apis
  /// developer just need to implement prefered auth provider awa,firebase,etc;'
  /// eg for firebase given below
  Future<String> _onAuthToken() async {
    /*Future<String> onAuthToken() async {
      bool isAnonymous  = FirebaseAuth.instance.currentUser?.isAnonymous == true;

      try {
        String? token = await FirebaseAuth.instance.currentUser?.getIdToken();

        if (token == null || isAnonymous) {
          return "";
        } else {
          token = "Token $token";
          return token;
        }
      } catch (exception) {
        return "";
      }
    }*/
    return "Token ";
  }

  ApiService._() {
    int timeOutSeconds = kReleaseMode ? 5000 : 5000;

    /// in milliseconds
    _baseOptions = BaseOptions(
        baseUrl: ApiUrls.getBaseUrl(),
        connectTimeout: timeOutSeconds,
        receiveTimeout: timeOutSeconds,
        followRedirects: false,
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        sendTimeout: timeOutSeconds);
    _dio = Dio(_baseOptions);
  }
}
