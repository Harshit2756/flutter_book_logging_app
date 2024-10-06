// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' ;

// import '../../utils/exceptions/app_exceptions.dart';


// class NetworkApiService {
//   NetworkApiService._privateConstructor();
//   static final NetworkApiService _instance =
//       NetworkApiService._privateConstructor();

//   static late bool isCalled;

//   factory NetworkApiService() {
//     isCalled = false;
//     return _instance;
//   }

//   /// Get request api (required String url, dynamic header)
//   Future getApiResponse(
//       {required String url, Map<String, String>? header}) async {
//     final _header = header ??
//         <String, String>{
//           "accept": "application/json; charset=UTF-8",
//           "authorization": "Bearer ${AuthRepository.getAccessToken}",
//         };
//     // if (kDebugMode) {
//     print('Get Request');
//     print('url: $url');
//     print('header: $_header');

//     dynamic responseJson;
//     try {
//       final response = await http
//           .get(Uri.parse(url), headers: _header)
//           .timeout(const Duration(seconds: 20));
//       if (kDebugMode) {
//         print('Response :${response.body}');
//       }
//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw NoInternetException('');
//     } on TimeoutException {
//       throw FetchDataException('Network Request time out');
//     }

//     return responseJson;
//   }

//   /// Post request api (required String url, required dynamic data, dynamic header)
//   Future postApiResponse({required String url, required dynamic data}) async {
//     final _header = <String, String>{
//       "accept": "application/json; charset=UTF-8",
//       "authorization": "Bearer ${AuthRepository.getAccessToken}",
//     };
//     if (kDebugMode) {
//       print('Post Request');
//       print('url : $url');
//       print('Header : $_header');
//       if (data is Map) {
//         print('{');
//         data.forEach((key, value) {
//           print('$key: $value (${value.runtimeType})');
//         });
//         print('}');
//       } else {
//         // If data is not a Map, just print it normally with its type.
//         var decodedData = jsonDecode(data);
//         print('Data : $decodedData (${decodedData.runtimeType})');
//       }
//     }

//     dynamic responseJson;
//     try {
//       Response response =
//           await post(Uri.parse(url), body: data, headers: _header)
//               .timeout(const Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw NoInternetException('No Internet Connection');
//     } on TimeoutException {
//       throw FetchDataException('Network Request time out');
//     }

//     if (kDebugMode) {
//       print('responseJson : $responseJson');
//     }
//     return responseJson;
//   }

//   /// Patch request api (required String url, required dynamic data, dynamic header)
//   Future patchApiResponse({required String url, required dynamic data}) async {
//     final _header = <String, String>{
//       "accept": "application/json; charset=UTF-8",
//       "authorization": "Bearer ${AuthRepository.getAccessToken}",
//     };
//     if (kDebugMode) {
//       print('Patch Request');
//       print('url : $url');
//       print('Header : $_header');
//       if (data is Map) {
//         print('{');
//         data.forEach((key, value) {
//           print('$key: $value (${value.runtimeType})');
//         });
//         print('}');
//       } else {
//         // If data is not a Map, just print it normally with its type.
//         var decodedData = jsonDecode(data);
//         print('Data : $decodedData (${decodedData.runtimeType})');
//       }
//     }

//     dynamic responseJson;
//     try {
//       Response response =
//           await patch(Uri.parse(url), body: data, headers: _header)
//               .timeout(const Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw NoInternetException('No Internet Connection');
//     } on TimeoutException {
//       throw FetchDataException('Network Request time out');
//     }

//     if (kDebugMode) {
//       print('responseJson : $responseJson');
//     }
//     return responseJson;
//   }

//   /// Delete request api (required String url, dynamic header)
//   Future deleteApiResponse({required String url}) async {
//     final _header = <String, String>{
//       "accept": "application/json; charset=UTF-8",
//       "authorization": "Bearer ${AuthRepository.getAccessToken}",
//     };
//     if (kDebugMode) {
//       print('Delete Request');
//       print('url : $url');
//       print('Header : $_header');
//     }

//     dynamic responseJson;
//     try {
//       Response response = await delete(Uri.parse(url), headers: _header)
//           .timeout(const Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw NoInternetException('No Internet Connection');
//     } on TimeoutException {
//       throw FetchDataException('Network Request time out');
//     }

//     if (kDebugMode) {
//       print('responseJson : $responseJson');
//     }
//     return responseJson;
//   }

//   dynamic returnResponse(http.Response response) {
//     if (kDebugMode) {
//       print('Response status: ${response.statusCode}');
//     }

//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body.toString());
//         return responseJson;
//       case 201:
//         dynamic responseJson = jsonDecode(response.body.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 500:
//         throw ServerErrorException(response.body.toString());
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       case 401:
//         if (isCalled == true) {
//           isCalled = false;
//           throw UnauthorisedException(response.body.toString());
//         } else {
//           isCalled = true;
//           SessionController().getRefreshToken();
//         }
//       default:
//         throw FetchDataException(
//             'Error occured while communicating with server');
//     }
//   }
// }
