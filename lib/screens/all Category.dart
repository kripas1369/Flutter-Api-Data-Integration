import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';

import 'category_products.dart';


class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getAllCategory(),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ProductByCategory(snapshot.data[index])));
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.all(23),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(45),
                      child: Center(
                        child: Text(snapshot.data[index].toString().toUpperCase(),
                        style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                );
                }

            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
