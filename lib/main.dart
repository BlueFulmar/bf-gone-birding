import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import './providers/great_places.dart';
import './screens/places_list_screen.dart';
import './screens/add_place_screen.dart';
import 'screens/place_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Great Places',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: PlacesListScreen(),
          routes: {
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
            PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
          }),
    );
  }
}
