import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:lawma_app/data/constant/string_const.dart';


/// This Generates a valid OAuth 1.0 URL
///
/// if [isHttps] is true we just return the URL with
/// [consumerKey] and [consumerSecret] as query parameters
Uri getOAuthURL(String requestMethod, String queryUrl) {
  String consumerKey = StringConst.consumerKey;
  String consumerSecret = StringConst.consumerSecret;

  String token = "";
  String url = queryUrl;
  bool containsQueryParams = url.contains("?");

  Random rand = Random();
  List<int> codeUnits = List.generate(10, (index) {
    return rand.nextInt(26) + 97;
  });

  /// Random string uniquely generated to identify each signed request
  String nonce = String.fromCharCodes(codeUnits);
  //DateTime().toUtc().toIso8601String();

  /// The timestamp allows the Service Provider to only keep nonce values for a limited time
  int timestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  debugPrint("Timestamp: ${timestamp}");

  //1655157847
  // 1655167911
  // 1655160975

  String parameters = "oauth_consumer_key=" +
      consumerKey +
      "&oauth_nonce=" +
      nonce +
      "&oauth_signature_method=HMAC-SHA1&oauth_timestamp=" +
      "$timestamp" +
      "&oauth_token=" +
      token +
      "&oauth_version=1.0&";

  if (containsQueryParams == true) {
    parameters = parameters + url.split("?")[1];
  } else {
    parameters = parameters.substring(0, parameters.length - 1);
  }

  Map<dynamic, dynamic> params = QueryString.parse(parameters);
  Map<dynamic, dynamic> treeMap = SplayTreeMap<dynamic, dynamic>();
  treeMap.addAll(params);

  String parameterString = "";

  for (var key in treeMap.keys) {
    parameterString = parameterString +
        Uri.encodeQueryComponent(key) +
        "=" +
        treeMap[key] +
        "&";
  }

  parameterString = parameterString.substring(0, parameterString.length - 1);

  String method = requestMethod;
  String baseString = method +
      "&" +
      Uri.encodeQueryComponent(
          containsQueryParams == true ? url.split("?")[0] : url) +
      "&" +
      Uri.encodeQueryComponent(parameterString);

  String signingKey = consumerSecret + "&" + token;
  crypto.Hmac hmacSha1 =
      crypto.Hmac(crypto.sha1, utf8.encode(signingKey)); // HMAC-SHA1

  /// The Signature is used by the server to verify the
  /// authenticity of the request and prevent unauthorized access.
  /// Here we use HMAC-SHA1 method.
  crypto.Digest signature = hmacSha1.convert(utf8.encode(baseString));

  String finalSignature = base64Encode(signature.bytes);

  String requestUrl = "";

  if (containsQueryParams == true) {
    requestUrl = url.split("?")[0] +
        "?" +
        parameterString +
        "&oauth_signature=" +
        Uri.encodeQueryComponent(finalSignature);
  } else {
    requestUrl = url +
        "?" +
        parameterString +
        "&oauth_signature=" +
        Uri.encodeQueryComponent(finalSignature);
  }

  return Uri.parse(requestUrl);
}


class QueryString {
  //List<String> listq = ["dhfvbdkjf", "vdfjhfvd"];

  /// Parses the given query string into a Map.
  static Map parse(String query) {
    var search = RegExp('([^&=]+)=?([^&]*)');
    var result = {};

// Get rid off the beginning ? in query strings.
    if (query.startsWith('?')) query = query.substring(1);

// A custom decoder.
    decode(String s) => Uri.decodeComponent(s.replaceAll('+', ' '));

// Go through all the matches and build the result map.
    for (Match match in search.allMatches(query)) {
      result[decode(match.group(1)!)] = decode(match.group(2)!);
    }

    return result;
  }
}
