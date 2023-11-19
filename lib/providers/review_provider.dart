import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewProvider with ChangeNotifier {
  final List<ReviewModel> _reviews = [];

  List<ReviewModel> get reviews => _reviews;

  Future<void> getReviews(int productId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('reviews')
          .where('productId', isEqualTo: productId)
          .get();
      _reviews.clear();

      for (final doc in snapshot.docs) {
        ReviewModel review = ReviewModel(
          name: doc['name'] ?? '',
          time: (doc['time'] as Timestamp).toDate(),
          review: doc['review'] ?? '',
          rating: doc['rating'] as double,
          productId: doc['productId'],
        );
        _reviews.add(review);
      }
      notifyListeners();
    } catch (error) {
      log('Error fetching reviews: $error');
      rethrow;
    }
  }

  Future<void> submitReview(ReviewModel newReview) async {
    try {
      await FirebaseFirestore.instance.collection('reviews').add({
        'name': newReview.name,
        'time': newReview.time,
        'review': newReview.review,
        'rating': newReview.rating,
        'productId': newReview.productId,
      });
      await getReviews(newReview.productId);
      notifyListeners();
    } catch (error) {
      log('Error submitting review: $error');
      rethrow;
    }
  }

// Future<void> deleteReview(ReviewModel review) async {
//   try {
//     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//         .instance
//         .collection('reviews')
//         .where('productId', isEqualTo: review.productId)
//         .where('name', isEqualTo: review.name)
//         .where('time', isEqualTo: review.time)
//         .where('review', isEqualTo: review.review)
//         .get();
//     if (snapshot.docs.isNotEmpty) {
//       await FirebaseFirestore.instance
//           .collection('reviews')
//           .doc(snapshot.docs.first.id)
//           .delete();
//
//       await getReviews(review.productId);
//       notifyListeners();
//     } else {
//       log('Review not found');
//     }
//   } catch (error) {
//     log('Error deleting review: $error');
//     rethrow;
//   }
// }
}
