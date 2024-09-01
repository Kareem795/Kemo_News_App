import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_project/Utils/constants.dart';
import 'package:news_project/bloc/states.dart';
import 'package:news_project/data/model/News_Data_Response.dart';
import 'package:news_project/data/model/Sources_Response.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit():super(HomeinitStates());
  static HomeCubit get(context) => BlocProvider.of(context);
  int selectedTapIndex = 0;
  Sources_Response? sourcesResponse;

  News_Data_Response? newsDataRespones;

  changeSource(int value) 
  {
    selectedTapIndex = value;
    emit(HomeChangeState());
  }

  Future<void> getSources(String id) async 
  {
    try
    {
      emit(HomeGetSoursesLoadingStates());
      Uri url = Uri.https
      (
        Constants.BaseURL, 
        "v2/top-headlines/sources",
        {
          "api_key": Constants.API_Key,
          "category":id
        }
      );

      http.Response response = await http.get(url);

      var json = jsonDecode(response.body);

      sourcesResponse = Sources_Response.fromJson(json);

      emit(HomeGetSoursesSuccessStates());

    }

    catch(e)
    {
      emit(HomeGetSoursesErrorStates());
    }
  }

  Future<void> getNewsData(String sourceID) async 
  {
    try
    {
      emit(HomeiGetNewsLoadingStates());
      Uri url = Uri.https
      (
        Constants.BaseURL, 
        "/v2/everything", 
        {"sources": sourceID,}
      );

      http.Response response = await http.get
      (
        url,
        headers: {"x-api-key": Constants.API_Key,},
      );

      var json = jsonDecode(response.body);

      newsDataRespones = News_Data_Response.fromJson(json);

      emit(HomeGetNewsSuccessStates());

    } 
    
    catch(e)
    {
      emit(HomeGetNewsErrorStates());
    }
  }
}


