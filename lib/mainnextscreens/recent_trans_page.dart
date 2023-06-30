import 'package:dapp_project/create_import.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RecentTransactionPage extends StatefulWidget {
  const RecentTransactionPage({Key? key}) : super(key: key);

  @override
  State<RecentTransactionPage> createState() => _RecentTransactionPageState();
}

class _RecentTransactionPageState extends State<RecentTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            child: Icon(Icons.person),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50)
            ),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('privateKey');
              //push to create and import page

              Navigator.pushAndRemoveUntil(context, 
                  MaterialPageRoute(builder: (context)=> CreateAndImport()), (route) => false,);

            },
            child: Container(
              height: 60,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout,size: 24,),
                    Text('LogOut',style: TextStyle(fontSize: 20,color: Colors.black),)
                  ],
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
