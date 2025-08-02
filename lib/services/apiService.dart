import 'dart:io';

import 'package:unimar_sab_19/interfaces/httpNativeInterface.dart';
import 'package:unimar_sab_19/services/httpNative.dart';
import 'package:unimar_sab_19/valueObject/emailAddress.dart';
import 'package:unimar_sab_19/valueObject/password.dart';

class ApiService {
  final HttpNativeInterface httpService;

  ApiService._(this.httpService);

  factory ApiService.getService() {
    var client = HttpClient();
    var httpService = HttpNative(client: client);
    return ApiService._(httpService);
  }
}
