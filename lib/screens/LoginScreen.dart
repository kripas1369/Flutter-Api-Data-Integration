import 'package:flutter/material.dart';
import 'package:flutterapidataintegration/apiscreen/apiservice.dart';
import 'package:flutterapidataintegration/screens/Homepage.dart';

class LoginScreen extends StatelessWidget {
TextEditingController nameController = TextEditingController(text: "mor_2314");
TextEditingController passwordController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "username"
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "password"
              ),
            ),
            Container(
              child: ElevatedButton(onPressed: ()async{
                await ApiService().userLogin(nameController.text,passwordController.text);
                final getToken = await ApiService().userLogin(nameController.text, passwordController.text);
                if(getToken['token']!=null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.cyan,content: Text("SUCCESS YOUR TOKEN IS ${getToken['token']}",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  )
                  ));
                  Future.delayed(Duration(seconds: 4),(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  });
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("username or password is inncorrect")));
                };
              },
              child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
