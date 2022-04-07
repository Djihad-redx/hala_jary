import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

const Map<String,String> headers = {};
const String url = "https://api.halajary.yesdigitallab.com";
class Repo{
Future<Response> requestMethod({
  Map<String,String>? headers = headers,
  required String? requestType,
  Map<String,dynamic>? body,
  String? url
})async{
  Response<dynamic>? response;
  if(requestType == "get"){
     return (await http.get(Uri.parse(url!),headers: headers)) as Response;
  }else if(requestType == "post"){
    return http.post(Uri.parse(url!),headers: headers,body: body) as Response;
  }else if(requestType =="delete"){
    return http.delete(Uri.parse(url!),headers: headers,body: body) as Response;
  }else if(requestType == "put"){
    return http.put(Uri.parse(url!),headers: headers,body: body) as Response;
  }
  return response!;
}

}