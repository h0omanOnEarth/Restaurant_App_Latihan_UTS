import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_uts/detail_restaurant_screen.dart';
import 'package:latihan_uts/model/restaurant.dart';


class RestaurantsScreen extends StatefulWidget {
  static const routeName = '/restaurants_list';
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
   int _selectedIndex = 0;
     void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot){
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return buildItem(context, restaurants[index]);
              },
            );
        } ,
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


Widget buildItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(restaurant.pictureId, width: 100),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurantScreen.routeName,
            arguments: restaurant);
      });
}
