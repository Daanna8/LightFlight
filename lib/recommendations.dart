// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ReviewScreen(),
    );
  }
}

class ReviewScreen extends StatelessWidget {
  final List<Review> reviews = [
    Review(avatar: 'images/aa.jpg',name: 'Sara', reviewText: 'had a great experience!', rating: 4),
    Review(avatar: 'images/bb.jpg',name: 'Ahmad', reviewText: "The best airline 💛", rating: 5),
    Review(avatar: 'images/cc.jpg',name: 'Noura', reviewText: "Great staff and services !", rating: 4),
    Review(avatar: 'images/dd.jpg',name: 'Abdullah', reviewText: "Everything was great 😍", rating: 5),
    Review(avatar: 'images/aa.jpg',name: 'Sarah', reviewText: "The service was slow ", rating: 2),
    Review(avatar: 'images/bb.jpg',name: 'Khaled', reviewText: 'had a great experience!', rating: 4),
      Review(avatar: 'images/cc.jpg',name: 'Maha', reviewText: "Everything was great 😍", rating: 5),
//hiiii11
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(child:Text(' Recommendations')),
         backgroundColor:  Color(0xFF1BAEC6),
        
        // ignore: prefer_const_constructors
       
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(review: reviews[index]);
        },
      ),
    );
  }
}

class Review {
  final String name;
  final String reviewText;
  final int rating;
  final String avatar; 
  

  Review({required this.avatar,required this.name, required this.reviewText, required this.rating});
}

class ReviewCard extends StatelessWidget {
  final Review review;

  ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Card(
      //
      child: ListTile(
        leading: CircleAvatar(
                backgroundImage: AssetImage(review.avatar),
                backgroundColor: Colors.transparent,
           ),
        title: Text(review.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(review.reviewText),
            SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}