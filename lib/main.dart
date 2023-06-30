import 'package:dapp_project/home_page.dart';
import 'package:dapp_project/mainnextscreens/wallet_page.dart';
import 'package:dapp_project/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider<WalletProvider>(
          create: (context) => WalletProvider(),
          child: const MyApp(),
       ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),// HomePage()
    );
  }
}

