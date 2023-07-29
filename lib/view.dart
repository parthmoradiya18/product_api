import 'package:flutter/material.dart';
import 'package:product_api/main.dart';

class view extends StatefulWidget {
  int stock;
  int price;
  double rating;
  String thumbnail;
  String title;

  view(this.stock, this.price, this.rating, this.thumbnail, this.title);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Home();
                  },
                ));
              },
              icon: Icon(Icons.home, size: 50))),
      body: Center(
        child: Container(
          height: 300,
          decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                child: Text("Title : ${widget.title}"
                    "\n"
                    "Price : ${widget.price}"
                    "\n"
                    "Rating : ${widget.rating}"
                    "\n"
                    "Stock : ${widget.stock}"),
              ),
              Container(
                height: 100,
                width: 100,
                // padding: EdgeInsets.all(5),
                // margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  "${widget.thumbnail}",
                  height: 95,
                  width: 95,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
