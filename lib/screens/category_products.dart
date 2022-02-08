import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';

import 'ProductDetail.dart';


class ProductByCategory extends StatelessWidget {
 final String categoryName;
 ProductByCategory(this.categoryName);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
      ),
      body: FutureBuilder(
        future: ApiService().getProductByCategory(categoryName),
        builder: (context,AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder:(context,index) {
                  return ListTile(
                    title: Text(snapshot.data[index]["title"],
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Image.network(snapshot.data[index]['image'],height:60,width:60,),
                    subtitle: Text("Price - \$"+ snapshot.data[index]["price"].toString(),
                      style: TextStyle(color: Colors.orange),
                    ),
                    onTap:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProductDetail(snapshot.data[index]['id'])),
                      );
                    },
                  );
                },
              ),
            );
          }
          return Center (
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}
