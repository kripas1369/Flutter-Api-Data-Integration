
import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index){
                return FutureBuilder(
                  future: ApiService().getSingleProduct(products[index]['productId']),
                  builder: (context,AsyncSnapshot asyncSnapshot){
                    if(asyncSnapshot.hasData){
                      return ListTile(
                        title: Text(asyncSnapshot.data['title']),
                        leading: Image.network(asyncSnapshot.data['image'],height: 60,),
                        subtitle: Text(
                          "Quantity - "+products[index]['quantity'].toString()
                        ),
                        trailing: IconButton(onPressed: ()async{
                          await ApiService().deleteCart('1');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cart is delet")));

                        },icon: Icon(Icons.delete),),
                      );
                    }
                    return LinearProgressIndicator();
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Text("Order Now",style: TextStyle(
            fontSize: 30,
          ),),
        ),
      ),
    );
  }
}
