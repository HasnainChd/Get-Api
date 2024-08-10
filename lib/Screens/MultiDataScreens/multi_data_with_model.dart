import 'package:api_series/ApiServices/api_service_for_multi_data.dart';
import 'package:api_series/Models/MultiDataModel/mult_data_model.dart';
import 'package:flutter/material.dart';

class MultiDataWithModel extends StatefulWidget {
  const MultiDataWithModel({super.key});

  @override
  State<MultiDataWithModel> createState() => _MultiDataWithModelState();
}

class _MultiDataWithModelState extends State<MultiDataWithModel> {
  bool isReady = false;
  late MultiData multiData;

  getMultiData() {
    isReady = true;
    ApiServiceForMultiData().getMultiData().then((value) {
      setState(() {
        multiData = value!;
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    getMultiData(); //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Data'),
      ),
      body: isReady
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text(
                  multiData.page.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Text(
                  multiData.perPage.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
                Text(
                  multiData.total.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  multiData.totalPages.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.brown),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: multiData.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(
                            multiData.data![index].id.toString(),
                          ),
                          title: Text(
                            multiData.data![index].name.toString(),
                          ),
                          subtitle: Text(
                            multiData.data![index].year.toString(),
                          ),
                          trailing: Text(
                            multiData.data![index].color.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text('URL: ${multiData.support!.url.toString()}',),
                Text('Text: ${multiData.support!.text.toString()}',),
              ],
            ),
    );
  }
}
