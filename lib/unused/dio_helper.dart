// import 'package:dio/dio.dart';
// export 'package:dio/dio.dart';

// class DioHelper {
//   static late Dio dio;


//   static init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: "",
//         connectTimeout: const Duration(minutes: 1),
//         receiveTimeout: const Duration(minutes: 1),
//         receiveDataWhenStatusError: true,
//         validateStatus: (_) => true,
//         contentType: Headers.jsonContentType,
//         responseType: ResponseType.json,
//       ),
//     );
//   }

//   static Future<Response> getData({
//     required String url,
//     Map<String, dynamic>? query,
//     String? token,
//   }) async {
//     return await dio.get(url,
//         queryParameters: query,
//         options: Options(
//           headers: {
//             'authorization': token,
//             "Content-Type": "application/json",
//             "Accept-Language": "EN",
//           },
//         ));
//   }

//   static Future<Response> postData({
//     required String url,
//     Map<String, dynamic>? query,
//     required Map<String, dynamic> data,
//     String? token,
//   }) async {
//     return await dio.post(url,
//         queryParameters: query,
//         data: data,
//         options: Options(
//           headers: {
//             'authorization': token,
//             "Content-Type": "application/json",
//             "Accept-Language": "EN",
//           },
//         ));
//   }


//   static Future<Response> putData({
//     required String url,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     String? token,
//   }) async {
//     return await dio.put(url,
//         queryParameters: query,
//         data: data,
//         options: Options(
//           headers: {
//             'authorization': token,
//             "Content-Type": "application/json",
//             "Accept-Language": "EN",
//           },
//         ));
//   }

//   static Future<Response> deleteData({
//     required String url,
//     Map<String, dynamic>? query,
//     Map<String, dynamic>? data,
//     String? token,
//   }) async {
//     return await dio.delete(
//       url,
//       queryParameters: query,
//       data: data,
//       options: Options(
//         headers: {
//           'authorization': token,
//           "Content-Type": "application/json",
//           "Accept-Language": "EN",
//         },
//       ),
//     );
//   }

// }
