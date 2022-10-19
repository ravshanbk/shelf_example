import 'dart:convert';

import 'package:shelf/shelf.dart';

class ServerResponse {
  static const _headers = {'content-type': 'application/json'};
  static Response success() => Response.ok(
        jsonEncode({"status_code": "200", "message": "Invan Communicator"}),
        headers: _headers,
      );

  static Response notFound() => Response.notFound(
        jsonEncode({"status_code": "404", "message": "Not Found"}),
        headers: _headers,
      );

  static Response badRequest(String message) => Response.ok(
        jsonEncode({"error": true, "message": message}),
        headers: _headers,
      );

  static Response initerenalServerError(String message) {
    return Response.internalServerError(
      body: jsonEncode({"status_code": 500, "message": message}),
      headers: _headers,
    );
  }
}
