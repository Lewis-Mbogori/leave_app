import 'package:flutter/material.dart';

class Leaves extends StatelessWidget {
Leaves({super.key, required this.results});
  final Map results;

  String time(){
    if(DateTime.now().hour >= 6 && DateTime.now().hour < 12){
      return 'Good Morning ${results['FirstName']}';

    }
    else if(DateTime.now().hour >= 12 && DateTime.now().hour <= 16){
      return 'Good Afternoon ${results['FirstName']}';
    }

    else{
      return 'Good Night ${results['FirstName']}';
    }
  }
  final _serial = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.handshake),
        title: Center(
          child: Column(
            children: [
              Text(time(), style: const TextStyle(fontSize: 25.0),),
              Text('${(results['Email']).split('@')[0]}',  style: const TextStyle(fontSize: 12.0),),
                 
            ],
          ),
        )
      ),

      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
                controller: _serial,
                decoration: const InputDecoration(
                  labelText: "Serial/Reference Number "
                ),
                // validation
                validator: (value) {
                  if(value!.isEmpty){
                    return'Value is not valid';
                  }
                  else if( int.tryParse (value)  == null){
                    return null;
                  }
                  else{
                    return null;
                  }
                },
                ),
          ),

        ],
      ),
      );
  }
}