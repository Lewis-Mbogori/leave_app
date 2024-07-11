import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:modcomleaveapp/data/api.dart';
import 'package:modcomleaveapp/my_leaves.dart';

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
  final _userid = TextEditingController();
  final _leavetype = TextEditingController();
  final _serial = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Column(
            children: [
              Text(time(), style: const TextStyle(fontSize: 25.0),),
              Text('${(results['email']).split('@')[0]}',  style: const TextStyle(fontSize: 12.0),),
                 
            ],
          ),
        )
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
              TextFormField(
              controller: _serial,
              decoration: const InputDecoration(
                labelText: "Serial Number"
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
              
              TextFormField(
              controller: _leavetype,
              decoration: const InputDecoration(
                labelText: "Leave Type"
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
              TextFormField(
              controller: _userid,
              decoration: const InputDecoration(
                labelText: "User ID"
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


            OutlinedButton(
            onPressed: () async{
            var isValid = _formKey.currentState!.validate();
            if(isValid){
              try{
                var response = await http.post(Uri.parse('$baseurl/apply'),
                body: json.encode({
                  'serial_number': _serial.text,
                  'leave_type': _leavetype.text,
                  'user_id': _userid.text,
                }),
                headers: {
                  'Content-Type': 'application/json'
                });
                if (response.statusCode == 200){
                  
                }
                else{
                  // failed
                }
              }
              catch(e){
                // alert user
                return;

            }
            


            }
          }, 
             child: const Text("Apply")),

            
             ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (_) => const LeaveApplications()));
             }, child: const Text('Proceed')) 
          ],
        ),
      ),
      );
  }
}