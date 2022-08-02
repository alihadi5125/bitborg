// import 'package:book_grocer/models/best_sellers_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class BestSellersRepo {
//   static Future<List<BestSellersModel>> getBestSellersData() async {
//     CollectionReference reference =
//     FirebaseFirestore.instance.collection('bestsellers');
//     QuerySnapshot bestSellersQuery = await reference.get();
//     var allBestSellersData = bestSellersQuery.docs.map((doc) => doc.data()).toList();
//     return allBestSellersData.map((e) => BestSellersModel.fromSnapshot(e)).toList();
//   }
// }

import 'package:flutter/cupertino.dart';

import '../models/all_news_category_model.dart';
import 'package:http/http.dart' as http;

class AllNewsCategoryRepo{
  /// Future<List<AllNewsModel>>
  static Future<void> getAllNewsCategoryData() async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMzQzYmZkNmE3Yzk3NDY0ZjkyYWYzOWJmM2QzNWI4ODEiLCJlbWFpbCI6ImFsaWhhZGk1MTI1QGdtYWlsLmNvbSIsImlhdCI6MTY0OTM5MzQ1MSwiZXhwIjoxNjQ5Mzk3MDUxfQ.EvofgvvOPVBR3XjDZyK0ddgPJTbN8O1rRqqtqfXcn0U'
    };
    var request = http.MultipartRequest('GET', Uri.parse('http://65.0.203.20:3000/main/news/all/0/10/all'));
    request.fields.addAll({
      'newsType': 'all',
      'skip': '0',
      'limit': '10',
      'type': 'all'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String allNewsResponse = await response.stream.bytesToString();
      debugPrint('response====>$allNewsResponse');
    }
    else {
    print(response.reasonPhrase);
    }

  }
}