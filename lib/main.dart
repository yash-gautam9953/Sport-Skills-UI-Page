import 'package:flutter/material.dart';
import 'models/skill.dart';
import 'services/skills_data_service.dart';
import 'widgets/skill_carousel.dart';

void main() {
  runApp(const SportsSkillsApp());
}

class SportsSkillsApp extends StatelessWidget {
  const SportsSkillsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Skills App by Yash Gautam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const SkillsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SkillsHomePage extends StatefulWidget {
  const SkillsHomePage({super.key});

  @override
  State<SkillsHomePage> createState() => _SkillsHomePageState();
}

class _SkillsHomePageState extends State<SkillsHomePage> {
  Map<String, List<Skill>> skillsByLevel = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  // JSON file se data load karo
  void _loadSkills() async {
    final skills = await SkillsDataService.loadSkills();
    setState(() {
      skillsByLevel = SkillsDataService.groupSkillsByLevel(skills);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Sports Skills',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: Colors.grey.withOpacity(0.1),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Develop Your Skills',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Master sports skills at every level',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Skills Carousels ordered by level progression
                  _buildLevelCarousel('Basic'),
                  _buildLevelCarousel('Intermediate'),
                  _buildLevelCarousel('Advanced'),

                  // Bottom padding
                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }

  Widget _buildLevelCarousel(String level) {
    final skills = skillsByLevel[level] ?? [];
    if (skills.isEmpty) return const SizedBox.shrink();

    return SkillCarousel(level: level, skills: skills);
  }
}
