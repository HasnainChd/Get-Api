import 'package:api_series/ApiServices/api_service_for_multi_data.dart';
import 'package:flutter/material.dart';

class MultiDataWithoutModel extends StatefulWidget {
  const MultiDataWithoutModel({super.key});

  @override
  State<MultiDataWithoutModel> createState() => _MultiDataWithoutModelState();
}

class _MultiDataWithoutModelState extends State<MultiDataWithoutModel> {

  bool isReady=false;
  dynamic multiData;

  getMultiData(){
    isReady=true;
    ApiServiceForMultiData().getMultiDataWoModel().then((value){
      setState(() {
        multiData=value!;
        isReady=false;
      });
    });
  }

  @override
  void initState() {
    getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Multi Data withOut Model'),),
      body: isReady? const Center(child: CircularProgressIndicator(),):
          Column(
            children: [
              Text(multiData['page'].toString(),style: const TextStyle(fontSize: 18,color: Colors.blue),),
              Text(multiData['per_page'].toString(),style: const TextStyle(fontSize: 18,color: Colors.black),),
              Text(multiData['total'].toString(),style: const TextStyle(fontSize: 18,color: Colors.red),),
              Text(multiData['total_pages'].toString(),style: const TextStyle(fontSize: 18,color: Colors.brown),),

              Expanded(child: ListView.builder(
                itemCount: multiData['data'].length,
                  itemBuilder: (context,index){
                return  Card(
                  child: ListTile(
                    leading: Text(multiData['data'][index]['id'].toString(),style: const TextStyle(fontSize: 16),),
                    title: Text(multiData['data'][index]['name'].toString(),style: const TextStyle(fontSize: 16),),
                    subtitle: Text(multiData['data'][index]['year'].toString(),style: const TextStyle(fontSize: 16),),
                    trailing: Text(multiData['data'][index]['color'].toString(),style: const TextStyle(fontSize: 16),),
                  ),
                );
              }))
            ],
          )
    );
  }
}
