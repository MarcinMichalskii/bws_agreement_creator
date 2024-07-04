import 'dart:async';

import 'package:dio/dio.dart';

Dio dio = Dio();

class CostRegisterError {
  final String message;
  CostRegisterError(this.message);

  factory CostRegisterError.fromJson(Map<String, dynamic> json) {
    return CostRegisterError(json['message']);
  }
}

class APIResponseState<T> {
  APIResponseState(
      {this.data, this.error, this.params, this.isLoading = false});
  final bool isLoading;
  final T? data;
  final CostRegisterError? error;
  final Map<String, dynamic>? params;
}

class ApiController<T> {
  final T Function(Map<String, dynamic> json) fromJsonFunction;

  ApiController(this.fromJsonFunction);

  Future<APIResponseState<T>> performPost(
      {required Map<String, dynamic> params, required String url}) async {
    try {
      Response response = await dio.post(url,
          data: params,
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode != 200) {
        return APIResponseState(
            error: CostRegisterError.fromJson(response.data), params: params);
      }
      return APIResponseState(
          data: fromJsonFunction(response.data), params: params);
    } catch (error) {
      return handleError(error);
    }
  }

  Future<APIResponseState<T>> performPut(
      {required Map<String, dynamic> params, required String url}) async {
    try {
      Response response = await dio.put(url,
          data: params,
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode != 200) {
        return APIResponseState(
            error: CostRegisterError.fromJson(response.data), params: params);
      }
      return APIResponseState(
          data: fromJsonFunction(response.data), params: params);
    } catch (error) {
      return handleError(error);
    }
  }

  Future<APIResponseState<T>> performDelete(
      {required Map<String, String> params, required String url}) async {
    try {
      Response response = await dio.delete(url,
          data: params,
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode != 200) {
        return APIResponseState(
            error: CostRegisterError.fromJson(response.data), params: params);
      }
      return APIResponseState(
          data: fromJsonFunction(response.data), params: params);
    } catch (error) {
      return handleError(error);
    }
  }

  APIResponseState<T> handleError(error) {
    try {
      return APIResponseState(
          error: CostRegisterError(error.response?.data['message']));
    } catch (error) {
      print(error.toString());
      return APIResponseState(
        error: CostRegisterError("Coś poszło nie tak"),
      );
    }
  }

  Future<APIResponseState<T>> performGet(
      {Map<String, String> params = const {}, required String url}) async {
    try {
      Response response = await dio.get(url,
          options: Options(headers: {'Content-Type': 'application/json'}),
          queryParameters: params);
      if (response.statusCode != 200) {
        return APIResponseState(
          error: CostRegisterError.fromJson(response.data),
          params: params,
        );
      }
      return APIResponseState(
          data: fromJsonFunction(response.data), params: params);
    } catch (error) {
      if (error is DioException && error.response?.data != null) {
        return APIResponseState(
            error: CostRegisterError.fromJson((error).response?.data),
            params: params);
      } else {
        return APIResponseState(
            error: CostRegisterError(
              "Coś poszło nie tak $url",
            ),
            params: params);
      }
    }
  }

  Future<APIResponseState> sendFormData(
      {required Map<String, dynamic> params, required String url}) async {
    try {
      Response response = await dio.post(url,
          data: FormData.fromMap(params),
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      if (response.statusCode != 200) {
        return APIResponseState(
            error: CostRegisterError(
                "Something went wrong on reqest $url with status code ${response.statusCode}"),
            params: null);
      }
      return APIResponseState(data: response.data, params: null);
    } catch (error) {
      return APIResponseState(
          error: CostRegisterError("Something went wrong on reqest $url"),
          params: null);
    }
  }
}
