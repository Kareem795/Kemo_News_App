import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kemo_news_app/constants.dart';
import 'package:kemo_news_app/data/model/News_Data_Response.dart';
import 'package:kemo_news_app/data/model/Sources_Response.dart';

class ApiManager 
{
  static Future<Sources_Response> getSources() async 
  {
    Uri url = Uri.https
    (
      Constants.BaseURL, 
      "/v2/everything", 
      {"api_key": Constants.API_Key}
    );

    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);

    Sources_Response sources_responses = Sources_Response.fromJson(json);

    return sources_responses;
  }

  static Future<News_Data_Response> getNewsData(String sourceID) async 
  {
    Uri url = Uri.https
    (
      Constants.BaseURL, 
      "/v2/everything", 
      {"sources": sourceID,}
    );

    http.Response response = await http.get
    (
      url,
      headers: {"X-Api-Key": Constants.API_Key,},
    );

    var json = jsonDecode(response.body);
    print(json);

    News_Data_Response model = News_Data_Response.fromJson(json);

    return model;
  }
}
