import 'dart:convert';

class UniversityObjectModel {
  UniversityObjectModel({
    required this.suggestions,
  });

  final List<String> suggestions;

  factory UniversityObjectModel.fromJson(Map<String, dynamic> json) =>
      UniversityObjectModel(
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
      };
}

class CompanyObjects {
  CompanyObjects({
    required this.suggestions,
  });

  final List<String> suggestions;

  factory CompanyObjects.fromJson(Map<String, dynamic> json) => CompanyObjects(
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
      };
}
