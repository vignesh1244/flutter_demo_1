import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({Key? key}) : super(key: key);

  @override
  _HomeScrennState createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> {
  //*******************************
  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  late List data;
  List imagesUrl = [];

  Future<String> fetchDataFromApi() async {
    var jsonData = await http.get(Uri.parse(
            "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json")
        // "https://s3-us-west-2.amazonaws.com/appsdeveloperblog.com/tutorials/files/cats.json"
        );
    var fetchData = jsonDecode(jsonData.body);

    setState(() {
      data = fetchData;
      data.forEach((element) {
        imagesUrl.add(element['url']);
      });
    });

    return "Success";
  }

  //**************************************

  ////////////////////////////////////////////////////
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(Uri.parse('http://manage.rinzyee.com/api-get-car-model/1'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  ////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cars Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<ProductsModel>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        // itemCount: imagesUrl.length,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                      image: AssetImage('assets/icon/icon.png'),
                                      // image: NetworkImage('https://via.placeholder.com/300.png/09f/fff%20C/O%20https://placeholder.com/'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                ReusbaleRow(
                                    title: 'id', value: snapshot.data!.data![index].id.toString()),
                                ReusbaleRow(
                                    title: 'name',
                                    value: snapshot.data!.data![index].name.toString()),
                                ReusbaleRow(
                                    title: 'type',
                                    value: snapshot.data!.data![index].type.toString())
                              ],
                            ),
                          );
                        });
                  } else {
                    return Text('Loading');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String title, value;

  ReusbaleRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
