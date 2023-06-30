import 'package:dapp_project/provider/wallet_provider.dart';
import 'package:dapp_project/registerandlogin/verify_mnemonic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  @override
  Widget build(BuildContext context) {

    final walletProvider = Provider.of<WalletProvider>(context);
    final mnemonic = walletProvider.generateMnemonic();
    final mnemonicWord = mnemonic.split(' ');

    void copyToClipboard(){
      Clipboard.setData(ClipboardData(text: mnemonic));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Copied to Clipboard')),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context)=>
          VerifyMnemonicPage(mnemonic: mnemonic),),);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 12,right: 12),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please store this mnemonic prase safely:',
                  style: TextStyle(color: Colors.black,fontSize: 16)),
              SizedBox(height: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                  List.generate(
                  mnemonicWord.length,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '${index + 1}. ${mnemonicWord[index]}',style: TextStyle(fontSize: 16.0),
                        ),
                      )
                  ),
              ),

              SizedBox(height: 18,),

              Center(
                child: InkWell(
                  onTap: (){
                    copyToClipboard();
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 8,right: 8),
                    height: 80,
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.copy,color: Colors.white,),
                        Text('Copy to Clipboard',
                          style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),
              )
            ],
        ),
      ),
    );
  }
}
