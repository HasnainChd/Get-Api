import 'dart:convert';

import 'package:api_series/Models/MultiplePostModel/List_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServicesList {
  //with Model
  Future<List<PostModel>?> getPostModel() async {
   try{

   }catch(e){
     print('error patching data $e');
   }

    return null;
  }

  //with-out Model
  Future<dynamic> getPostWithOutModel() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print('Error patching data: $e');
    }
  }
}
