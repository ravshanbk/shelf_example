// ignore_for_file: void_checks

import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:shelf/shelf_io.dart' as shelf_io;
// ignore: depend_on_referenced_packages
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_example/server/server_response.dart';

class AppLocalServer {
  static listen() async {
    try {
      final ip = InternetAddress.anyIPv4;
      final handler = const shelf.Pipeline()
          .addMiddleware(shelf.logRequests())
          .addHandler(_echoRequest);

      final server = await shelf_io.serve(handler, ip, 8080);

      // Enable content compression
      server.autoCompress = true;
    } catch (err) {
      throw Exception("LISTEN SERVER EXEPTION: $err");
    }
  }

  static Future<shelf.Response> _echoRequest(shelf.Request request) async {
    try {
      String asString = await request.readAsString();
      print(asString);
      return ServerResponse.success();
    } catch (err) {
      throw Exception("ECHO REQUEST ERROR: $err");
    }
  }
}
