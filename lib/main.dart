import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/model.dart';
import 'package:product_api/view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List l = [];

  get_http() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map map = jsonDecode(response.body);
    l = map['products'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    get_http();
    // Add listeners to this class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product api"),
        ),
        drawer: Drawer(backgroundColor: Colors.lightGreen,
          child: ListView.builder(itemCount: l.length,
            itemBuilder: (context, index) {
              Product p = Product.fromJson(l[index]);
              return Card(margin: EdgeInsets.all(5),
                color: Colors.orange,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return view(p.stock,p.price,p.rating,p.thumbnail,p.title);
                    },));
                  },
                  title: Text("${p.title}"),
                  leading: CircleAvatar(backgroundImage: NetworkImage("${p.thumbnail}"),),
                ),
              );
            },
          ),
        ),
        body: ListView.separated(
            itemCount: l.length,
            itemBuilder: (context, index) {
              Product p = Product.fromJson(l[index]);
              return Card(
                margin: EdgeInsets.all(5),
                color: Colors.grey,
                child: ListTile(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return view(p.stock,p.price,p.rating,p.thumbnail,p.title);
                  },));
                },
                  title: Text("${p.title}"),
                  subtitle: Text("${p.price}"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${p.thumbnail}"),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.red,
                height: 5,
              );
            },
        )
    );
  }
}
