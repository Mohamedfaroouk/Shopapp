import 'package:dio/dio.dart';

class diohelp {
  static Dio mydio = Dio();

  static void init() {
    mydio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> gethomedata({required String text}) async {
    mydio.options.headers = {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization":
          "C0BmSW2QS9aFfhcxEmrBsWlscOysCRa3LP88Yw4wqsdbYWuYYorZB6vdVFIjY1LjvA07X3"
    };

    return await mydio.get("$text");
  }

  static Future<Response> postdata(
      {required String text, required Map<String, dynamic> data}) async {
    mydio.options.headers = {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization":
          "C0BmSW2QS9aFfhcxEmrBsWlscOysCRa3LP88Yw4wqsdbYWuYYorZB6vdVFIjY1LjvA07X3"
    };

    return await mydio.post("$text", data: data);
  }
}
