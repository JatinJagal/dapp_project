import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:dapp_project/provider/wallet_provider.dart';

import '../mainnextscreens/wallet_page.dart';
class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;
  const VerifyMnemonicPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  State<VerifyMnemonicPage> createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {

  bool isVerified = false;
  String verificationText = '';

  void verifiedMnemonic(){
    final walletProvider = Provider.of<WalletProvider>(context,listen: false);

    if(verificationText.trim() == widget.mnemonic.trim()){
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey){
        setState(() {
          isVerified = true;
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    void navigateToWalletPage(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> WalletPage()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Verified Mnemonic and create'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please verified your mnemonic prase:'),
            SizedBox(height: 24,),
            TextField(
              onChanged: (value){
                setState(() {
                  verificationText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter mnemonic prase',
              ),
            ),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){
              verifiedMnemonic();
            }, child: Text('Verify')),
            SizedBox(height: 24,),
            ElevatedButton(
                onPressed: isVerified ? navigateToWalletPage : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black
                ),
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
