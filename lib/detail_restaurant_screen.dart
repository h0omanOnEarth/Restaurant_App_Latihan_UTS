import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan_uts/model/restaurant.dart';


class DetailRestaurantScreen extends StatelessWidget {
  static const routeName = '/detail_news_list';
  final Restaurant restaurant;
  const DetailRestaurantScreen({Key? key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(restaurant.name),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.description),
                    Divider(color: Colors.grey),
                    Text(
                      restaurant.city,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    const Divider(color: Colors.grey),
                    Text('Date: ${restaurant.rating}'),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                        
                        },
                        child: const Text('See Menu'))
                  ],
                )),
          ],
        )));
  }
}
