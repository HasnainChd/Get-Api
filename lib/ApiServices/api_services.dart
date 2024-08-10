import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:api_series/Models/SinglePostModel/singlePostModel.dart';

class ApiServices{
  //with Model
  Future<SinglePostModel?> getSinglePost()async{
        try {
        final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
        if (response.statusCode == 200) {
        return SinglePostModel.fromJson(jsonDecode(response.body));
        }
        } catch (e) {
    print('Error fetching post: $e');
    }
        return null;
    }


    //withOut Model

  Future<dynamic> getSinglePostWoutModel()async{
    try{
      final response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      if(response.statusCode==200){
        final data= jsonDecode(response.body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  }