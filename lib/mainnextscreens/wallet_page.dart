import 'package:dapp_project/controller/home_controller.dart';
import 'package:dapp_project/mainnextscreens/recent_trans_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'main_wallet_page.dart';
import 'nft_screen_page.dart';
class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navbarItem = [
      NavigationDestination(icon: Icon(Icons.list), label: 'Assets'),
      NavigationDestination(icon: Icon(Icons.image), label: 'NFTs'),
      NavigationDestination(icon: Icon(Icons.person), label: 'Options'),
    ];

    var navBody = [
      MainWalletPage(),
      NftScreenPage(),
      RecentTransactionPage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('your wallet'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(() => 
      NavigationBarTheme(data: NavigationBarThemeData(
        indicatorColor: Colors.blue,
        labelTextStyle: MaterialStateProperty.all(TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white))
      ), child: NavigationBar(destinations: navbarItem,
        backgroundColor: Colors.pinkAccent,
        selectedIndex: controller.currentNavIndex.value,
        onDestinationSelected: (value){
          controller.currentNavIndex.value = value;
        },
      ))),
    );
  }
}
