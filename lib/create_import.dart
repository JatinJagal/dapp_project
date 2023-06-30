import 'package:dapp_project/registerandlogin/create_wallet.dart';
import 'package:dapp_project/registerandlogin/import_wallet.dart';
import 'package:flutter/material.dart';
class CreateAndImport extends StatefulWidget {
  const CreateAndImport({Key? key}) : super(key: key);

  @override
  State<CreateAndImport> createState() => _CreateAndImportState();
}

class _CreateAndImportState extends State<CreateAndImport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: FlutterLogo()),

            SizedBox(height: 20,),
      
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(onPressed: (){
                Navigator.push((context), MaterialPageRoute(builder: (context)=>CreateWalletPage()));
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text('Create Wallet')),
            ),
            SizedBox(height: 40,),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> ImportWallet()));
              },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                      )
                  ),
                  child: Text('Import from seed',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
            )
                    
          ],
        ),
      ),
    );
  }
}
