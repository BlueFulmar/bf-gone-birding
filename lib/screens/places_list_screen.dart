// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/place_detail_screen.dart';
import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      // ignore: todo
      // TODO Setup pull to refresh as this is a one time request
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('places').get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final List<DocumentSnapshot>? places = snapshot.data?.docs;
            // final List<Map<String, dynamic>> data =
            //     snapshot.data!.docs as List<Map<String, dynamic>>;

            print(places?.length);
            print(places?.toString());
            // print(data.length);
            // print(data);
            return ListView.builder(
                itemCount: places?.length,
                itemBuilder: (BuildContext context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(places![i]['name'].toString()),
                    ),
                  );
                });
          }),
    );

    //   body:
    //   FutureBuilder<DocumentSnapshot>(
    //       future: FirebaseFirestore.instance
    //           .collection('places')
    //           .doc('HNIKd5cJZx9YKR6fDccF')
    //           .get(),
    //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //         if (snapshot.hasError) {
    //           return const Center(
    //             child: Text('Something went wrong'),
    //           );
    //         }
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         }
    //         Map<String, dynamic> data =
    //             snapshot.data!.data() as Map<String, dynamic>;
    //         return Center(
    //           child: Text(
    //             data['name'],
    //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //           ),
    //         );
    //       }),
    // );

    // body: FutureBuilder(
    //   future: Provider.of<GreatPlaces>(context, listen: false).getPlaces(),
    //   builder: (context, snapshot) => snapshot.connectionState ==
    //           ConnectionState.waiting
    //       ? const Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : Consumer<GreatPlaces>(
    //           child: const Center(
    //             child: Text('Got no places yet, start adding some!'),
    //           ),
    //           builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
    //               ? ch!
    //               : ListView.builder(
    //                   itemCount: greatPlaces.items.length,
    //                   itemBuilder: (ctx, i) => ListTile(
    //                     leading: CircleAvatar(
    //                       backgroundImage: FileImage(
    //                         greatPlaces.items[i].image,
    //                       ),
    //                     ),
    //                     title: Text(greatPlaces.items[i].title),
    //                     subtitle: Text(greatPlaces.items[i].location.address),
    //                     onTap: () {
    //                       Navigator.of(context).pushNamed(
    //                           PlaceDetailScreen.routeName,
    //                           arguments: greatPlaces.items[i].id);
    //                     },
    //                   ),
    //                 ),
    //         ),
    // ),
    // );
  }
}
