import 'package:flutter/material.dart';

class Leaves extends StatelessWidget {
  const Leaves({super.key, required this.results});
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
      ),);
  }
}