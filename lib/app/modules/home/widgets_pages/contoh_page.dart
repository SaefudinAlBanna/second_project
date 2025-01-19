import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContohPage extends StatelessWidget {
  const ContohPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh input data'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // INPUT NAMA
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'iput namanya nggih.. ^_^',
              labelText: 'Nama *',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'bagi No WA nya dong..',
              labelText: 'No Handphone *',
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
          ),
        ],
      ),
    );
  }
}
