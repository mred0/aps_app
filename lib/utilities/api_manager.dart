import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_tnd/utilities/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiManager {
  final Connectivity _connectivity = Connectivity();
  var result;

  Future<String> checkInternet() async {
    try {
      result = await _connectivity.checkConnectivity();
      return _getConnectionStatus(result);
    } catch (e) {
      print("Couldn't check connectivity status: $e");
      return 'Failed to get connectivity.';
    }
  }

  String _getConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return 'Connected to WiFi';
      case ConnectivityResult.mobile:
        return 'Connected to Mobile Network';
      case ConnectivityResult.none:
        return 'No Internet Connection';
      default:
        return 'Unknown Connection Status';
    }
  }

  postCall(String url, Map<String, dynamic> request, BuildContext context,
      {Map<String, String>? extraHeders}) async {
    // try {
    var uri = Uri.parse(url);

    final headers = await getHeaders(extraHeders: extraHeders);

    log(headers.toString());
    log(uri.toString());
    log(request.toString());
    http.Response response =
        await http.post(uri, body: jsonEncode(request), headers: headers);

    log("${response.statusCode}");
    log(response.body);
    return await json.decode(response.body);

    // } catch (e) {
    //   LoginResponse commonResponse =
    //       LoginResponse(message: e.toString(), status: "0");
    //   return await json.decode(
    //     json.encode(commonResponse.toJson()),
    //   );
    // }
  }

  getCall(String url, Map<String, dynamic> request) async {
    try {
      Map<String, String> headers;
      headers = await getHeaders();
      var uri2 = Uri.parse(url);

      uri2 = uri2.replace(queryParameters: request);
      http.Response response = await http.get(uri2, headers: headers);
      log("$uri2");
      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        log("${response.statusCode}");
        log(response.body);
        // LoginResponse commonResponce =
        // LoginResponse(message: "Unauthenticated", status: "401");
        // return await json.decode(json.encode(commonResponce.toJson()));
      } else {
        log("${response.statusCode}");
        log(response.body);
        return await json.decode(response.body);
      }
    } catch (e) {
      // LoginResponse commonResponse =
      // LoginResponse(message: e.toString(), status: "0");
      // return await json.decode(json.encode(commonResponse.toJson()));
    }
  }

  Future<Map<String, String>> getHeaders(
      {Map<String, String>? extraHeders}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(CommonStrings.userToken);
    if (extraHeders != null) {
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
        ...extraHeders,
      };
    }

    if (token == null) {
      log(token.toString());
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
    } else {
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
    }
  }
}
