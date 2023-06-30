import 'package:dapp_project/create_import.dart';
import 'package:dapp_project/mainnextscreens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/wallet_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              final mnemonic = walletProvider.generateMnemonic();
              final privateKey = await walletProvider.getPrivateKey(mnemonic);
              final publicKey = await walletProvider.getPublicKey(privateKey);
              
              print('Mnemonic: $mnemonic');
              print('Privar Key: $privateKey');
              print('Public key: $publicKey');
            },
                child: Text('Generate Wallet')),

            SizedBox(height: 40,),

            ElevatedButton(onPressed: (){
              Navigator.push((context), MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text('Next Sceen'))
          ],
        ),
      ),
    );
  }
}
