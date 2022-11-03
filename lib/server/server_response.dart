import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:shelf/shelf.dart' as shelf;

class ServerResponse {
  static const _headers = {'content-type': 'application/json'};
  static shelf.Response success() => shelf.Response.ok(
        jsonEncode({"status_code": "200", "message": "Invan Communicator"}),
        headers: _headers,
      );

  static shelf.Response notFound() => shelf.Response.notFound(
        jsonEncode({"status_code": "404", "message": "Not Found"}),
        headers: _headers,
      );

  static shelf.Response badRequest(String message) => shelf.Response.ok(
        jsonEncode({"error": true, "message": message}),
        headers: _headers,
      );

  static shelf.Response initerenalServerError(String message) {
    return shelf.Response.internalServerError(
      body: jsonEncode({"status_code": 500, "message": message}),
      headers: _headers,
    );
  }
}
