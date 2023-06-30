import 'dart:convert';
import 'dart:ffi';

import 'package:dapp_project/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';
import 'package:dapp_project/utils/get_balance.dart';
import 'package:web3dart/web3dart.dart';

class MainWalletPage extends StatefulWidget {
  const MainWalletPage({Key? key}) : super(key: key);

  @override
  State<MainWalletPage> createState() => _MainWalletPageState();
}

class _MainWalletPageState extends State<MainWalletPage> {

  String walletAddress = '';
  String balance = '';
  String pvKey = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    laodWalletData();
  }

  Future<void> laodWalletData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privateKey');

    if(privateKey != null){
      final walletProvider = WalletProvider();
      await walletProvider.loadPrivateKey();

      EthereumAddress address = await walletProvider.getPublicKey(privateKey);
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });

      String response = await getBalance(address.hex,'sepolia');

      dynamic data = jsonDecode(response);

      String newBalance = data['balance'] ?? '0';

      //new ether amount

      EtherAmount latestBalance = EtherAmount.fromBigInt(
          EtherUnit.wei, BigInt.parse(newBalance));

      String latestBalanceInEther = latestBalance.getValueInUnit(
          EtherUnit.ether).toString();

      setState(() {
        balance = latestBalanceInEther;
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0,right: 8.0),
      height: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 320,
              // color: Colors.green,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Wallet Address',style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(walletAddress,style: TextStyle(color: Colors.grey,fontSize: 20),),
                  SizedBox(height: 24,),
                  Text('Balance',style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(balance,style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(height: 64,width: 64,
                        child: Icon(Icons.send,size: 26,color: Colors.white,),
                        decoration: BoxDecoration(
                        color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),),
                      Container(height: 64,width: 64,
                        child: Icon(Icons.refresh,size: 26,color: Colors.white,),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)
                      ),)
                    ],
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              height: 355,
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(14.0),
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sepolia ETH',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text(balance,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 50.0,
                          // spreadRadius: 20,
                          offset: Offset(8.0, 8.0)
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
