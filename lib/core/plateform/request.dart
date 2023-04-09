import 'package:http/http.dart' as http;

import '../errors/exection.dart';

abstract class RequestProvider<R> {
  RequestProvider();

  Future<R> post({
    required Uri uri,
    required Map<String, String> headers,
    required String body,
  });
  Future<R> get({
    required Uri uri,
    required Map<String, String> headers,
  });
  Future<R> put({
    required Uri uri,
    required Map<String, String> headers,
    required String body,
  });
  Future<R> delete();
}

class RequestProviderImpl implements RequestProvider<http.Response> {
  @override
  Future<http.Response> delete() {
    throw UnimplementedError();
  }

  @override
  Future<http.Response> get({
    required Uri uri,
    required Map<String, String> headers,
  }) async {
    var request = http.Request('GET', uri);
    request.headers.addAll(headers);

    try {
      var streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      throw RequestExeption();
    }
  }

  @override
  Future<http.Response> post({
    required Uri uri,
    required Map<String, String> headers,
    required String body,
  }) async {
    var request = http.Request('POST', uri);
    request.headers.addAll(headers);
    request.body = body;

    try {
      var streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      throw RequestExeption();
    }
  }

  @override
  Future<http.Response> put({
    required Uri uri,
    required Map<String, String> headers,
    required String body,
  }) async {
    var request = http.Request('PUT', uri);
    request.headers.addAll(headers);
    request.body = body;

    try {
      var streamedResponse = await request.send();
      return await http.Response.fromStream(streamedResponse);
    } catch (e) {
      throw RequestExeption();
    }
  }
}
