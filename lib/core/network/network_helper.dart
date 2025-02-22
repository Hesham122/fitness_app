part of 'network.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() : _dio = _configureDio();

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }

  Future<Response> get({
    required String endPoint,
     //required String host,
     //required String apiKey,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.get(endPoint,
        options: Options(headers: {
          // "Accept": "*/*",
          // "Host": "localhost:3000",
          // "User-agent": "curl/8.9.0"
          // "x-rapidapi-host": host,
           //"x-rapidapi-key": apiKey,
        }),
        queryParameters: params,
        //options: await _configureOptions(withToken)
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.post(endPoint,
        data: data,
        queryParameters: params,
        options: await _configureOptions(withToken));
    return response;
  }

Future<Response> delete({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.delete(endPoint,
        data: data,
        queryParameters: params,
        options: await _configureOptions(withToken));
    return response;
  }






  Future<Options> _configureOptions(bool withToken) async {
    Options options = Options();
    if (withToken) {
      var token = CachingHelper.instance?.readString(CachingKey.TOKEN);
      options.headers = {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}
