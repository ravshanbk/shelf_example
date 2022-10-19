// ignore_for_file: void_checks

import 'dart:io';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_example/server/server_response.dart';
import 'package:shelf_example/utils/colored_print.dart';

class AppLocalServer {
  static listen() async {
    try {
      final ip = InternetAddress.anyIPv4;
      final handler = const Pipeline()
          .addMiddleware(logRequests())
          .addHandler(_echoRequest);

      final server = await shelf_io.serve(handler, ip, 8080);

      // Enable content compression
      server.autoCompress = true;
    } catch (err) {
      throw Exception("LISTEN SERVER EXEPTION: $err");
    }
  }

  static Future<Response> _echoRequest(Request request) async {
    try {
      String asString = await request.readAsString();
      asString.printf("request as string");
      return ServerResponse.success();
    } catch (err) {
      throw Exception("ECHO REQUEST ERROR: $err");
    }
  }
}
