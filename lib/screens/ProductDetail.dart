import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';


class ProductDetail extends StatelessWidget {


final int id;
ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProduct(id),
        builder: ( context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Container(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Image.network(snapshot.data['image'],height: 200,width: double.infinity,),
                  SizedBox(height: 40,),
                  Center(
                    child: Text("\$"+snapshot.data['price'].toString(),style: TextStyle(
                    fontSize: 26
                  ),
                    ),
                  ),
                  Text(snapshot.data['title'],style: TextStyle(
                    fontSize: 24
                  ),),
                  Chip(label: Text(snapshot.data['category'].toString(),style: TextStyle(
                    fontSize: 25
                  ),)),
                  Text(snapshot.data["description"])
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: ()async{
          await ApiService().updateCart(1, id);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added to cart")));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
