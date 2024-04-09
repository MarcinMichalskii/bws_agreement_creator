import 'package:dio/dio.dart';

class CostRegisterError {
  final String message;
  CostRegisterError(this.message);

  factory CostRegisterError.fromJson(Map<String, dynamic> json) {
    return CostRegisterError(json['message']);
  }
}

class APIResponseState {
  APIResponseState({this.data, this.error, this.params});
  final dynamic data;
  final CostRegisterError? error;
  final Map<String, String>? params;
}

class ParsedResponseState<T> {
  ParsedResponseState(
      {this.isLoading = false, this.data, this.error, this.params});
  final T? data;
  final CostRegisterError? error;
  final bool isLoading;
  final Map<String, String>? params;

  ParsedResponseState.fromAPIResponseState(
      APIResponseState state, T? parsedData)
      : isLoading = false,
        data = parsedData,
        error = state.error,
        params = state.params;
}

class ApiController {
  ApiController();

  Future<APIResponseState> performPost(
      {required Map<String, String> params,
      required String url,
      String? accessToken}) async {
    Dio dio = Dio();

    try {
      Response response = await dio.post(url,
          data: params,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer $accessToken'
          }));
      if (response.statusCode != 200) {
        return APIResponseState(
            error: CostRegisterError.fromJson(response.data), params: params);
      }
      return APIResponseState(data: response.data, params: params);
    } catch (error) {
      return handleError(error);
    }
  }

  APIResponseState handleError(error) {
    try {
      return APIResponseState(
          error: CostRegisterError(error.response?.data['message']));
    } catch (error) {
      return APIResponseState(
        error: CostRegisterError("Coś poszło nie tak"),
      );
    }
  }

  Future<APIResponseState> performGet(
      {required String url, String? accessToken}) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'authorization': "Bearer $accessToken"
          }));
      if (response.statusCode != 200) {
        return APIResponseState(
          error: CostRegisterError.fromJson(response.data),
        );
      }
      return APIResponseState(
        data: response.data,
      );
    } catch (error) {
      if (error is DioError && error.response?.data != null) {
        return APIResponseState(
            error: CostRegisterError.fromJson((error).response?.data));
      } else {
        return APIResponseState(
          error: CostRegisterError("Coś poszło nie tak $url"),
        );
      }
    }
  }

  Future<APIResponseState> sendFormData(
      {required Map<String, dynamic> params, required String url}) async {
    Dio dio = Dio();

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
