part of '../network.dart';

class ResponseCode {
  // ignore: constant_identifier_names
  static const int SUCCESS = 200;
  // ignore: constant_identifier_names
  static const int NO_CONTENT = 201;
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400;
  // ignore: constant_identifier_names
  static const int UNAUTORISED = 401;
  // ignore: constant_identifier_names
  static const int FORBIDDEN = 403;
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR = 500;
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404;
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT = -1;
  // ignore: constant_identifier_names
  static const int CANCEL = -2;
  // ignore: constant_identifier_names
  static const int RECIEVE_TIMEOUT = -3;
  // ignore: constant_identifier_names
  static const int SEND_TIMEOUT = -4;
  // ignore: constant_identifier_names
  static const int CACHE_ERROR = -5;
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = -6;
  // ignore: constant_identifier_names
  static const int DEFAULT = -7;
}
