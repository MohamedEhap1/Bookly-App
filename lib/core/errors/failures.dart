import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: "Connection timeout with Api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with Api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Receive timeout with Api server");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "badCertificate error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request with Api was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: "Unexpect error, please try again later!");
      default:
        return ServerFailure(
            errorMessage: "Opps there was an error, please try again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: "Your request Not Found, please try later!");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: "Internal server error, please try later!");
    } else {
      return ServerFailure(
          errorMessage: "Opps there was an error, please try again");
    }
  }
}
