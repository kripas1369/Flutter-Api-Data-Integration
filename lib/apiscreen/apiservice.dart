import 'dart:convert';

import 'package:http/http.dart' as http;



class ApiService {
  Future getAllpost() async {
    final allProductUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(allProductUrl);
    // print(response.statusCode);
    // print(response.body);
    return jsonDecode(response.body);
  }
  Future getSingleProduct(id) async {
    final singleProductUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(singleProductUrl);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future getAllCategory()async{
    final allCategoryUrl = Uri.parse("https://fakestoreapi.com/products/categories");
    final response = await http.get(allCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future getProductByCategory(String CateName)async{
    final allCategoryUrl = Uri.parse("https://fakestoreapi.com/products/category/$CateName");
    final response = await http.get(allCategoryUrl);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }


  Future getCart(String userId)async{
    final fetchCartProducts = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartProducts);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future userLogin(String username,String password)async{
    final loginUrl =Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl,body:{
      'username' : username,
      'password' : password,
    });
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }

  Future updateCart(int userId,int productId)async{
    final updateCartUrl =Uri.parse("https://fakestoreapi.com//carts/$userId");
    final response = await http.put(updateCartUrl,body: {
      "userId":"$userId",
      "date":DateTime.now().toString(),
      "products":[
        {
          "productId":"$productId",
          "quantity":"1",

        }
      ].toString()
    });
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);

  }

  Future deleteCart(String userId)async{
    final fetchCartProducts = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.get(fetchCartProducts);
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }



}