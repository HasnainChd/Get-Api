import 'dart:convert';

import 'package:http/http.dart'as http;

import '../Models/MultiDataModel/mult_data_model.dart';
class ApiServiceForMultiData{

  //Multi data withModel
  Future<MultiData?> getMultiData()async{
    try{
      var response= await http.get(Uri.parse('https://reqres.in/api/unknown'));
      if(response.statusCode==200){
        return MultiData.fromJson(jsonDecode(response.body));
      }
    }
    catch(e){
      print('error while fetching data $e');
    }
    return null;
}

  //Multi data Without Model

  Future<dynamic> getMultiDataWoModel() async{
    try{
      final response= await http.get(Uri.parse('https://reqres.in/api/unknown'));
      if(response.statusCode==200){
        final data= jsonDecode(response.body);
        return data;
      }

    }catch(e) {
      print('error while fetching data $e');
    }
    return null;
  }
}