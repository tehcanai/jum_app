import 'package:dio/dio.dart';

String _endpoint = 'http://10.0.2.2:3333/';

class Api {
  final String endpoint;

  Dio setup() {
    var dio = Dio(
      BaseOptions(
        baseUrl: endpoint,
        followRedirects: false,
        validateStatus: (status) {
          status ??= 418;
          return status < 600;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return dio;
  }

  Api(this.endpoint);
}

Api api = Api(_endpoint);
