import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/skill.dart';

class SkillsDataService {
  // JSON file se data load karne ke liye
  static Future<List<Skill>> loadSkills() async {
    try {
      // JSON file load karo
      final String jsonString = await rootBundle.loadString(
        'assets/data/skills.json',
      );

      // JSON parse karo
      final List<dynamic> jsonList = json.decode(jsonString);

      // Skill objects banao
      return jsonList.map((json) => Skill.fromJson(json)).toList();
    } catch (e) {
      print('Error loading skills: $e');
      return [];
    }
  }

  // Skills ko level ke hisab se group karo
  static Map<String, List<Skill>> groupSkillsByLevel(List<Skill> skills) {
    final Map<String, List<Skill>> grouped = {
      'Basic': [],
      'Intermediate': [],
      'Advanced': [],
    };

    for (final skill in skills) {
      if (grouped.containsKey(skill.level)) {
        grouped[skill.level]!.add(skill);
      }
    }

    return grouped;
  }
}
