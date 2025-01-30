
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mainfoodpage extends StatefulWidget {
  const Mainfoodpage({super.key});

  @override
  State<Mainfoodpage> createState() => _MainfoodpageState();
}

class _MainfoodpageState extends State<Mainfoodpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Food"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Foods").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshots.hasError) {
            return Center(child: Text("Error: ${snapshots.error}"));
          }

          if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
            return Center(child: Text("No data available"));
          }

          return ListView(
            children: makeListWidget(snapshots),
          );
        },
      ),
    );
  }

  List<Widget> makeListWidget(AsyncSnapshot<QuerySnapshot> snapshots) {
    return snapshots.data!.docs.map((doc) {
      return ListTile(
        title: Text(doc['food_name']),
        subtitle: Text(doc['price'].toString()),
      );
    }).toList();
  }
}

