# Sports Skills App

A Flutter application that displays sports skills in horizontal carousels grouped by difficulty level.

## Assignment Overview

This app was built as part of a Flutter Developer Internship assignment. It demonstrates:

- JSON data parsing and grouping
- Horizontal scrollable carousels
- Clean, responsive UI design
- Proper code structure and organization

## Features

### ✅ Requirements Met

1. **JSON Data Parsing**: Parses skills data with `name`, `level`, and `image` properties
2. **Level Grouping**: Skills are automatically grouped into three categories:
   - **Basic** (Green theme)
   - **Intermediate** (Orange theme)
   - **Advanced** (Red theme)
3. **Horizontal Carousels**: Each level has its own smooth scrollable carousel
4. **Clean Card Design**: Each skill displays as a card with image and name
5. **Proper Ordering**: Levels are displayed in progression order (Basic → Intermediate → Advanced)
6. **Smooth Scrolling**: Optimized scroll physics for great user experience

### 🎨 UI Features

- Material Design 3 theming
- Responsive layout that works on different screen sizes
- Loading states with progress indicators
- Error handling for image loading
- Color-coded level indicators
- Clean typography and spacing
- Subtle shadows and rounded corners

### 🏗️ Architecture

```
lib/
├── main.dart                 # App entry point and main UI
├── models/
│   └── skill.dart           # Skill data model
├── services/
│   └── skills_data_service.dart  # Mock JSON data and parsing
└── widgets/
    ├── skill_card.dart      # Individual skill card widget
    └── skill_carousel.dart  # Horizontal carousel widget
```

## Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code with Flutter plugins

### Installation

1. Clone this repository
2. Navigate to the project directory:
   ```bash
   cd sports_skills_app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

### Testing

Run the widget tests:

```bash
flutter test
```

## Sample Data

The app uses mock JSON data that includes sports skills like:

- **Basic**: Dribbling, Ball Control, Passing, Shooting
- **Intermediate**: Vault, Precision Passing, Tactical Awareness, Speed Control
- **Advanced**: Agility, Advanced Techniques, Match Strategy, Leadership

## Technical Implementation

### Data Flow

1. `SkillsDataService` provides mock JSON data
2. Data is parsed into `Skill` objects using `fromJson()` factory
3. Skills are grouped by level in `getSkillsByLevel()`
4. UI displays three `SkillCarousel` widgets in order
5. Each carousel contains multiple `SkillCard` widgets

### Performance Optimizations

- Efficient `ListView.builder` for horizontal scrolling
- Image caching with loading states
- Minimal widget rebuilds using proper state management
- Smooth scroll physics with `BouncingScrollPhysics`

## Screenshots/Demo

Run the app to see:

- Horizontal scrollable skill cards
- Color-coded difficulty levels
- Smooth scrolling performance
- Responsive design

## Submission

This project demonstrates:

- ✅ Correct grouping and ordering of levels
- ✅ Clean, responsive UI design
- ✅ Good code quality & structure
- ✅ Smooth scrolling and performance

Built with ❤️ using Flutter
