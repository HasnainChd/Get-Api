import 'package:api_series/ApiServices/api_services.dart';
import 'package:api_series/Models/SinglePostModel/singlePostModel.dart';
import 'package:flutter/material.dart';

class SinglePostScreen extends StatefulWidget {
  SinglePostScreen({super.key});

  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  bool isReady = false;
  SinglePostModel singlePostModel = SinglePostModel();

  getSinglePost() {
    isReady = true;
    ApiServices().getSinglePost().then((value) {
      setState(() {
        singlePostModel = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSinglePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Single Post'),
        ),
        body: isReady
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      singlePostModel.id.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    Text(
                      singlePostModel.title.toString(),
                      style: const TextStyle(fontSize: 17, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      singlePostModel.body.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ));
  }
}
