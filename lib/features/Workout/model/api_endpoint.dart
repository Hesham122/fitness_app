
class Endpoint {
  static String baseUrl = "https://exercisedb.p.rapidapi.com/exercises";
    static String bodyPart = "bodyPart/back?limit=10&offset=0";
    static String exerciceName = "name/legs?offset=0&limit=10";
     
  // static Dio? dio;
  // init() {
  //   dio = Dio(BaseOptions(
  //       baseUrl: "",
  //       receiveDataWhenStatusError: true));
  // }

  // static Future<Response>? getworkoutData(String url) {
  //   dio?.options.headers = {
  //     "x-rapidapi-host": "exercisedb.p.rapidapi.com",
  //     "x-rapidapi-key": "554a02e03dmshd886ff48681c04dp19af10jsna2f57238ab4d",
  //   };
  //   return dio?.get(url);
  // }
}

// class ApiKey {

// }
