import 'package:dapp_project/create_import.dart';
import 'package:dapp_project/mainnextscreens/wallet_page.dart';
import 'package:dapp_project/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    if(walletProvider.privateKey == null){

      //if Private key doesn't exist, load createorImport
      return CreateAndImport();
    }else{
      //if private key exist load walletpage
      return WalletPage();
    }
  }
}
