import 'package:api_series/ApiServices/api_services.dart';
import 'package:flutter/material.dart';

class SinglePostWithoutModel extends StatefulWidget {
  const SinglePostWithoutModel({super.key});

  @override
  State<SinglePostWithoutModel> createState() => _SinglePostWithoutModelState();
}

class _SinglePostWithoutModelState extends State<SinglePostWithoutModel> {
  bool isReady=false;
  dynamic singlePost;

  getSinglePost(){
    isReady=true;
    ApiServices().getSinglePostWoutModel().then((value){
      setState(() {
        singlePost= value;
        isReady=false;
      });
    });
  }

  @override
  void initState() {
    getSinglePost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Post WithOut Model',textAlign: TextAlign.center,),
      ),
      body: isReady? const Center(child: CircularProgressIndicator(),):
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey.shade400,
              child: Column(
                children: [
                  Text(singlePost['userId'].toString(),style: const TextStyle(fontSize: 20, ),),
                  Text(singlePost['title'].toString(),style: const TextStyle(fontSize: 20,),),
                  Text(singlePost['body'].toString(),style: const TextStyle(fontSize: 20,color: Colors.blue),)
                ],
              ),
            ),
          )
    );
  }
}
