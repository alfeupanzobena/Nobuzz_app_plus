import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:nobuzz_app_plus/configs/config.dart';
import 'package:nobuzz_app_plus/data/http/client_http.dart';

class ClientHttpImp implements ClientHttp {
  final _ioc = HttpClient();
  Client _client = Client();


  ClientHttpImp() {
    _ioc.badCertificateCallback =(X509Certificate cert, String host, int port) => true;
    _client = IOClient(_ioc);
  }

  @override
  Future<Response> get({required String route, required Map<String, String>? headers}) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        return await _client.get(
          Uri.parse(ConfigApp.baseUrl + route),
          headers: headers,
        );

      } else {

        return Response(
          "{\"code\": 511, \"message\": \"Sem internet\"}", 
          511,
        );
      }
    } catch (e) {

      return Response(
        "{\"code\": 500, \"message\": \"Ocorreu um erro interno\"}", 
        500,
        request: Request("GET", Uri.parse(ConfigApp.baseUrl + route))
      );

    }
  }

  @override
  Future<Response> post({required String route, required Map<String, String>? headers, dynamic body}) async {
    try {
      bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        return await _client.post(
          Uri.parse(ConfigApp.baseUrl + route),
          headers: headers, 
        );

      } else {

        return Response(
          "{\"code\": 511, \"message\": \"Sem internet\"}", 
          511,
        );

      }
    } catch (e) {
      return Response(
        "{\"code\": 500, \"message\": \"Ocorreu um erro interno\"}", 500,
        request: Request("POST", Uri.parse(ConfigApp.baseUrl + route))
      );
    }
  }
}