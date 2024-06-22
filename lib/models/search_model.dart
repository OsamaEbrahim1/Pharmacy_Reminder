import 'package:reminder_app/core/api/end_points.dart';

class SearchModel {
  final int quantity;
  final String title;
  final String description;
  
  SearchModel({required this.quantity,required this.title,required this.description});

  factory SearchModel.fromJson(Map<String, dynamic> jsonData) {
    return SearchModel(
        title: jsonData["data"][ApiKey.title] ?? " ",
        quantity: jsonData["data"][ApiKey.quantity] ?? 0,
        description: jsonData["data"][ApiKey.description] ?? " null ",
        );
  }
}