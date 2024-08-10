import 'package:api_series/ApiServices/api_services_for_list.dart';
import 'package:flutter/material.dart';

class PostListWithoutModel extends StatefulWidget {
  const PostListWithoutModel({super.key});

  @override
  State<PostListWithoutModel> createState() => _PostListWithoutModelState();
}

class _PostListWithoutModelState extends State<PostListWithoutModel> {
  bool isReady = false;
  dynamic postList = [];

  getPost() {
    isReady = true;
    ApiServicesList().getPostWithOutModel().then((value) {
      setState(() {
        postList = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List WithOut Model'),
      ),
      // body: isReady? const Center(child: CircularProgressIndicator(),):
      //     ListView.builder(
      //       itemCount: postList.length,
      //         itemBuilder: (context,index){
      //       return Card(
      //         child: ListTile(
      //           leading: Text(postList[index]['id'].toString()),
      //           title: Text(postList[index]['title'].toString()),
      //           subtitle: Text(postList[index]['body'].toString()),
      //         ),
      //       );
      //     }),
      body: FutureBuilder(
        future: ApiServicesList().getPostWithOutModel(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.length,
                itemBuilder: (context,index){
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                color: Colors.grey.shade300,
                child: ListTile(
                  leading: CircleAvatar(child: Text(snapshot.data[index]['id'].toString())),
                  title: Text(snapshot.data[index]['title'].toString(),style: const TextStyle(color: Colors.red),),
                  subtitle: Text(snapshot.data[index]['body'].toString(),style: const TextStyle(color: Colors.blue),),
                ),
              );
            });
          }else{
            return  const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
