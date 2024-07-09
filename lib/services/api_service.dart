// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// enum apiMethod {
//   get,
//   post,
//   delete,
//   update,
// }

// class ApiService {
//   static Map errorResponse = {};
//   static Dio dio = Dio();

//   static Future<void> dioInitializerAndSetter({required String token}) async {
//     if (token.length > 5) {
//       String tokenFromShared;
//       await SharedPreferencesService.prefs.setString("token", token);
//       tokenFromShared = SharedPreferencesService.prefs.getString("token")!;

//       print(tokenFromShared);

//       dio.options.headers["Authorization"] = "Bearer $tokenFromShared";

//       print("set token");
//     }
//   }

//   ///token remover
//   static Future<void> tokenRemover() async {
//     dio.options.headers["Authorization"] = "";
//     print("token remover");
//   }

//   ///api method set up
//   static Future<Response<dynamic>?> apiMethodSetup(
//       {required apiMethod method,
//       required String url,
//       var data,
//       var queryParameters,
//       Function(int, int)? onSendProgress,
//       Function(int, int)? onRecieveProgress,
//       Options? options}) async {
//     dio.options.baseUrl = baseURL;
//     dio.options.connectTimeout = 10000;
//     dio.options.receiveTimeout = 10000;

//     try {
//       Response? response;
//       switch (method) {
//         case apiMethod.get:
//           if (data != null) {
//             response = await dio.get(url,
//                 queryParameters: data, options: options ?? Options());
//           } else {
//             response = await dio.get(url, options: options ?? Options());
//           }
//           break;
//         case apiMethod.post:
//           response = await dio.post(url,
//               data: data,
//               queryParameters: queryParameters,
//               onSendProgress: onSendProgress,
//               onReceiveProgress: onRecieveProgress);
//           break;
//         case apiMethod.delete:
//           // ignore: todo
//           // TODO: Handle this case.
//           break;
//         case apiMethod.update:
//           // ignore: todo
//           // TODO: Handle this case.
//           break;
//       }
//       return response;
//     } on DioError catch (e) {
//       print(e);
//       if (e.response?.statusCode == 401) {
//         errorResponse["status"] = "401";
//         errorResponse["message"] = "Authorization error";
//         print(errorResponse);
//       } else if (e.response?.statusCode == 500) {
//         Fluttertoast.showToast(msg: 'Server Error');
//       } else if (e.type == DioErrorType.receiveTimeout) {
//         Fluttertoast.showToast(msg: 'Check your network speed');
//       } else if (e.type == DioErrorType.connectTimeout) {
//         Fluttertoast.showToast(msg: 'Check your connectivity');
//       } else if (e.error is SocketException) {
//         errorResponse["status"] = "101";
//         errorResponse["message"] = "internet error";
//         Fluttertoast.showToast(msg: 'Please check your network');
//         print(errorResponse);
//       } else {
//         print("103");
//       }
//     }
//     return null;
//   }
// }
