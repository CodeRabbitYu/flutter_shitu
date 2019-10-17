///
/// Create by Rabbit on 2019/09/29.
///
import 'package:dio/dio.dart';

var baseOptions = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {"content-type": "application/json"});

var request = Dio();
