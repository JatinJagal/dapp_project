import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NftScreenPage extends StatefulWidget {
  const NftScreenPage({Key? key}) : super(key: key);

  @override
  State<NftScreenPage> createState() => _NftScreenPageState();
}

class _NftScreenPageState extends State<NftScreenPage> {

  Future<void> _loadNFTList() async{
    final response = await http.get(
      Uri.parse('')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
