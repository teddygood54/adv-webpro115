import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Thai",style: TextStyle(fontSize: 30.0),),
            Text("News", style: TextStyle(color: Colors.black, fontSize: 30.0)
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: ,
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categorieName;
  CategoryTile({this.imageUrl, this.categorieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl, width: 120, height: 60,),
        ],
      ),
    );
  }
  
}