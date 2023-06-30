import 'package:dapp_project/mainnextscreens/wallet_page.dart';
import 'package:dapp_project/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {

  bool isVerified = false;
  String verificationText = '';

  void navigateToWalletPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WalletPage()));
  }

  @override
  Widget build(BuildContext context) {

    void verifyMnemonic() async{
      final walletProvider = Provider.of<WalletProvider>(context,listen: false);
      navigateToWalletPage();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(12.0),
        // color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Enter your mnemonic phrase:',style: TextStyle(color: Colors.black,fontSize: 16),),
            SizedBox(height: 24.0,),
            TextField(
              onChanged: (value){
                setState(() {
                    verificationText = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter mnemonic phrase'
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: verifyMnemonic,
                  child: Text('Import',style: TextStyle(color: Colors.white,fontSize: 16),)),
            )

          ],
        ),
      ),
    );
  }
}
