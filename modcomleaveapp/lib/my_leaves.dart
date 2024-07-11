import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:modcomleaveapp/data/api.dart';

class LeaveApplications extends StatefulWidget {
  const LeaveApplications({super.key});

  @override
  State<LeaveApplications> createState() => _LeaveApplicationsState();
}

class _LeaveApplicationsState extends State<LeaveApplications> {
  //- id number, leave_type, serial_number, user_id
  List<dynamic>getApplications(){
    return applications;
  }

  List applications = [];
  // function to fetch data from API
  Future getLeaves() async {

    http.Response response = await http.get(Uri.parse('$baseurl/leave-app'));
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        applications = response.body as List<dynamic>;
      });
      print('Leave API' + applications.toString());
    }
    else{
      print('API' + response.body);
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.refresh))],
      ),
      body: Column(
        children: [
          const Text("My Application"),

          Column(
            children: List.generate(applications.length, (index){
              return ListTile(
                title: Text(applications[index]['leave_type']),
                subtitle: Text(applications[index]['serial_number']),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
              );
              

            }),
          )
        ],
      ),
    );
  }
}