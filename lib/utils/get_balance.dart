import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getBalance(String address, String chain) async{

  final url = Uri.http("192.168.251.96:8000","/get_token_balance", {
  'chain': chain,
  'address': address,
  });

  final response = await http.get(url);



  if(response.statusCode == 200){
    return response.body;
  }else{
    throw Exception('Failed To Load Data...');
  }

}

// final url = Uri.http("192.168.251.96:8000","/get_token_balance", {
//   'chain': chain,
//   'address': address,
// });

// final response = await http.get(url);