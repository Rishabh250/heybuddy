// To parse this JSON data, do
//
//     final skillModel = skillModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SkillModel skillModelFromJson(String str) =>
    SkillModel.fromJson(json.decode(str));

String skillModelToJson(SkillModel data) => json.encode(data.toJson());

class SkillModel {
  SkillModel({
    required this.suggestions,
  });

  final List<String> suggestions;

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "suggestions": List<dynamic>.from(suggestions.map((x) => x)),
      };
}
