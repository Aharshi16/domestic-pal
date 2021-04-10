import 'package:domestic_pal/shared/cusloading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cooklist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        elevation: 0.0,
        title: Text('Cook List'),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("empDetails").where("jobProfile", isEqualTo: "Cook").snapshots(),
          builder: (context, snapshot){

            if(snapshot.data == null) return CusLoading();

            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot empdetails = snapshot.data.documents[index];
                return ListTile(
                  title: Text(empdetails['name'] ?? 'default'),
                  //subtitle: empdetails['rating'] ?? 'default',
                );
               /* return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(empdetails['name'] ?? 'default'),
                    ],
                  )
                );*/
              },
            );
          },
        )
    );
  }
}