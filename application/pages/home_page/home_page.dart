import 'package:flutter/material.dart';
import 'package:sample/application/pages/list_view_location.dart/location_listview.dart';

import '../map_page/map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 51, 88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MapPage()));
              }, child: const Text('GET YOUR CURRENT LOCATION')),
            ),Card(
              elevation: 3,
              child: Container(
                height: 66,
                width: 66,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationListPage()));
                  },
                  child: const Text('List of the Location'))),
            )
          ],
        ),
      ),
    );

  }
}