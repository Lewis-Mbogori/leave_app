import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modcomleaveapp/leave.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _InputState();
}

class _InputState extends State<Login> {
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Application'),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
              TextFormField(
              controller: _fname,
              decoration: const InputDecoration(
                labelText: "First Name"
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
              controller: _lname,
              decoration: const InputDecoration(
                labelText: "Last Name"
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
              controller: _email,
              decoration: const InputDecoration(
                labelText: "Email"
              ),
              // validation
              validator: (value) {
                var validator = EmailValidator.validate('$value');
                if(!validator){
                  return null;
                }
                else{
                  return 'Enter a valid email';
                }
              },
              ),
              TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                labelText: "Password"
              ),
              // validation
              validator: (value) {
                if(value!.isEmpty){
                    return'Enter a password';
                }
                else if(value.length < 6){
                  return 'Password must be at least 6 characters';
                }
                else{
                  return null;
                }
              },
              ),
            OutlinedButton(
              onPressed: (){
            var isValid = _formKey.currentState!.validate();
            if(isValid){
              try{

                Map<String, String> results = {
                'First Name': _fname.text,
                'Last Name': _lname.text,
                'Email': _email.text,
                'Password': _password.text
              };

              Navigator.push(context, MaterialPageRoute(builder: (_)=>  Leaves(results: results,)));
              }
              catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
              }
              
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your input fields')));
            }



          }, 
             child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}