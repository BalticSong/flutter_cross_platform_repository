// lib/data/models/entry_model.dart

class EntryModel {
  final String name;
  final List<String> images;
  final String collectionName;
  final String price;
  // Add other necessary fields

  EntryModel({
    required this.name,
    required this.images,
    required this.collectionName,
    required this.price,
  });

  // Add factory method to convert JSON to model
  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      name: json['im:name']['label'],
      images: List<String>.from(json['im:image'].map((image) => image['label'])),
      collectionName: json['im:collection']['im:name']['label'],
      price: json['im:price']['label'],
    );
  }
}
