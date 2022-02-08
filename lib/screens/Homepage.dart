import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';

import '../main.dart';
import 'ProductDetail.dart';
import 'all Category.dart';
import 'cart_screen.dart';
class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: Text("Cybertron"),
                accountEmail: Text("Cybertronnepal.com"),
                currentAccountPicture: CircleAvatar(
                  child: Image.asset("assets/Main.png"),
                ),
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
              ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),ListTile(
                onTap: (){},
                title: Text("Loaction"),
                leading: Icon(Icons.add_photo_alternate_outlined) ,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("HomePage"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory()));
          }, icon: Icon(Icons.view_list)),
          IconButton(
            color:Colors.orange,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));

            },
          icon:Icon(Icons.add_shopping_cart)
          ,)
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getAllpost(),
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
