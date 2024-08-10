import 'package:api_series/ApiServices/api_services_for_list.dart';
import 'package:flutter/material.dart';

import '../../Models/MultiplePostModel/List_post_model.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {

  bool isReady = false;

  List<PostModel> postModel = [];

  getPostList() {
    isReady = true;
    ApiServicesList().getPostModel().then((value) {
      setState(() {
        postModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    getPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Post List'),),
        body: isReady ? const Center(child: CircularProgressIndicator(),) :
            ListView.builder(
              itemCount: postModel.length,
                itemBuilder: (context,index){
              return  Card(
                color: Colors.grey.shade300,
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                child: ListTile(
                  leading: Text(postModel[index].id.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                  title: Text(postModel[index].title.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(postModel[index].body.toString()),
                ),
              );
            })
    );
  }
}
