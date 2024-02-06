// import 'package:dio/dio.dart';

// class Failure {
//   final String errorMessage;
//   Failure({required this.errorMessage});
// }

// class ServerFailure extends Failure {
//   ServerFailure({required super.errorMessage});
//   factory ServerFailure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return ServerFailure(errorMessage: 'Connection timeout with ApiServer');

//       case DioExceptionType.sendTimeout:
//         return ServerFailure(errorMessage: 'Send timeout with ApiServer');

//       case DioExceptionType.receiveTimeout:
//         return ServerFailure(errorMessage: 'Receive timeout with ApiServer');

//       case DioExceptionType.badResponse:
//         return ServerFailure.fromResponse(
//             dioException.response!.statusCode, dioException.response!.data);
//       case DioExceptionType.cancel:
//         return ServerFailure(errorMessage: 'Request to ApiServer was canceled');

//       case DioExceptionType.unknown:
//         if (dioException.message!.contains('SocketException')) {
//           return ServerFailure(errorMessage: 'No Internet Connection');
//         }
//         return ServerFailure(
//             errorMessage: 'Unexpected Error, Please try again!');
//       default:
//         return ServerFailure(
//             errorMessage: 'Opps There was an Error, Please try again');
//     }
//   }
//   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
//       return ServerFailure(errorMessage: response['error']['message']);
//     } else if (statusCode == 404) {
//       return ServerFailure(
//           errorMessage: 'Your request not found, Please try later!');
//     } else if (statusCode == 500) {
//       return ServerFailure(
//           errorMessage: 'Internal Server error, Please try later');
//     } else {
//       return ServerFailure(
//           errorMessage: 'Opps There was an Error, Please try again');
//     }
//   }
// }
